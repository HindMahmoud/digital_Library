﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace digital_Library.modals
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class digitalLibEntities : DbContext
    {
        public digitalLibEntities()
            : base("name=digitalLibEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<faculty> faculties { get; set; }
        public virtual DbSet<student> students { get; set; }
        public virtual DbSet<university> universities { get; set; }
        public virtual DbSet<user> users { get; set; }
        public virtual DbSet<requestTable> requestTables { get; set; }
        public virtual DbSet<merchent_ref_number> merchent_ref_number { get; set; }
        public virtual DbSet<images_Paid> images_Paid { get; set; }
    }
}
