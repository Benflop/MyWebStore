<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MyWebStore._Default" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>EG3779 - My Web Store</h2>
            </hgroup>
            <p>
                E-commerce web site created using ASP.NET Web Forms
            </p>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
   <section style="vertical-align: middle">
   </section>
</asp:Content>
