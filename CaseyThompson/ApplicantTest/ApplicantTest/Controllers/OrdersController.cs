using ApplicantTest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MySql.Data.MySqlClient;
using System.Configuration;

namespace ApplicantTest.Controllers
{
    public class OrdersController : Controller
    {
        // GET: Orders
        public ActionResult Index()
        {
            List<Orders> orders = new List<Orders>();
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = "SELECT order_id, date_created, date_updated FROM `order`";
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            orders.Add(new Orders
                            {
                                Order_Id = Convert.ToInt32(sdr["Order_Id"]),
                                Date_Created = Convert.ToDateTime(sdr["Date_Created"]),
                                Date_Updated = Convert.ToDateTime(sdr["Date_Updated"]),
                            });
                        }
                    }
                    con.Close();
                }
            }
            return View(orders);
        }

        // GET: Orders/Order/{order_id}
        public ActionResult Order(int id)
        {
            var order = new Order();
            order.Order_Id = id;
            order.Items = new List<LineItem>();
            order.Order_Total = 0.00m;
            order.Order_Qty = 0;
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
            using (MySqlConnection con = new MySqlConnection(constr))
            {
                string query = String.Format("SELECT * FROM applicant_test.`user` WHERE user_id = {0};",id);
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        sdr.Read();
                        order.User_FirstName = (sdr["User_FirstName"]).ToString();
                        order.User_LastName = (sdr["User_LastName"]).ToString();
                        order.User_Address1 = (sdr["User_Address1"]).ToString();
                        order.User_Address2 = (sdr["User_Address2"]).ToString();
                        order.User_City = (sdr["User_City"]).ToString();
                        order.User_State = (sdr["User_State"]).ToString();
                        order.User_Zip = (sdr["User_Zip"]).ToString();
                    }
                    con.Close();
                }
                query = String.Format("SELECT item.description, item.qty, unit.name, unit.cost FROM `line_item` item LEFT JOIN `unit` unit ON item.unit_id = unit.unit_id WHERE item.order_id = {0};", id);
                using (MySqlCommand cmd = new MySqlCommand(query))
                {
                    cmd.Connection = con;
                    con.Open();
                    using (MySqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while(sdr.Read()){
                            order.Items.Add(new LineItem
                            {
                                Item_Description = (sdr["Description"]).ToString(),
                                Item_Qty = Convert.ToInt32(sdr["Qty"]),
                                Unit_Name = (sdr["Name"]).ToString(),
                                Unit_Cost = Convert.ToDecimal(sdr["Cost"])
                            });

                        }
                    }
                    con.Close();
                }
                foreach(LineItem item in order.Items) { 
                    order.Order_Total += item.Unit_Cost * item.Item_Qty;
                    order.Order_Qty += item.Item_Qty;
                }
            }
            


            
            return View(order);
        }
    }
}