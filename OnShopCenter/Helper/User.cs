using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;

namespace OnShopCenter.Helper
{
    public class User
    {
        public int UserId { get; set; }


        public string FullName { get; set; }


        public string TaxNumber { get; set; }


        public string DateOfBirth { get; set; }


        public string Email { get; set; }


        public bool IsActive { get; set; }


        public string RoleName { get; set; }


        public int RoleId { get; set; }



        public string Address { get; set; }


        public string ZipCode { get; set; }


        public string PhoneNumber { get; set; }


        public string Gender { get; set; }

    }
}