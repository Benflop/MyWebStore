using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MyWebStore.Models;

namespace MyWebStore.Logic
{
    public class AddCategories
    {
        public bool AddCategory(string CategoryName, string CategoryDesc)
        {
            var myCategory = new Category();

            myCategory.CategoryName = CategoryName;
            myCategory.Description = CategoryDesc;

            EG3779WebStoreEntities _db = new EG3779WebStoreEntities();

            _db.Categories.Add(myCategory);
            _db.SaveChanges();

            return true;
        }
    }
}