using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyWebStore.Models;

namespace MyWebStore.Logic
{
    public class RemoveProducts
    {
        public bool RemoveProduct(string SelectedProduct)
        {
            var myProduct = new Product();

            //Get DB Context - link to the entity model that you've created
            EG3779WebStoreEntities _db = new EG3779WebStoreEntities();

            //Add product to DB.
            _db.Products.Remove(myProduct);
            _db.SaveChanges();

            //Success
            return true;
        }
    }
}