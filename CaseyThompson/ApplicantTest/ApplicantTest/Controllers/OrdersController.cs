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
    }
}