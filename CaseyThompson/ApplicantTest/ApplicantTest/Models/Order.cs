using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ApplicantTest.Models
{
    public struct LineItem
    {
        public string Item_Description { get; set; }
        public int Item_Qty { get; set; }
        public string Unit_Name { get; set; }
        public decimal Unit_Cost { get; set; }
    }
    public class Order
    {
        public int Order_Id { get; set; }
        public decimal Order_Total { get; set; }
        public int Order_Qty{ get; set; }
        public string User_FirstName { get; set; }
        public string User_LastName { get; set; }
        public string User_Address1 { get; set; }
        public string User_Address2 { get; set; }
        public string User_City { get; set; }
        public string User_State { get; set; }
        public string User_Zip { get; set; }
        public List<LineItem> Items{ get; set; }

    }
}