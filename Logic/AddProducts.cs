using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyWebStore.Models;

namespace MyWebStore.Logic
{
    public class AddProducts
    {
        public bool AddProduct(string ProductName, string ProductDesc, string ProductPrice,
            string ProductCategory, string ProductImagePath)
        {
            var myProduct = new Product();
            myProduct.ProductName = ProductName;
            myProduct.Description = ProductDesc;
            myProduct.UnitPrice = Convert.ToDouble(ProductPrice);
            myProduct.ImagePath = ProductImagePath;
            myProduct.CategoryID = Convert.ToInt32(ProductCategory);

            //Get DB Context - link to the entity model that you've created
            EG3779WebStoreEntities _db = new EG3779WebStoreEntities();

            //Add product to DB.
            _db.Products.Add(myProduct);
            _db.SaveChanges();

            //Success
            return true;
        }
    }
}