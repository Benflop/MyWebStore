<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="MyWebStore.Admin.AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
    <h1>Administrator</h1>
    <hr />
    <table>
    <tr>
        <td><h3>Add Category:</h3></td>

    </tr>
    
        <tr>
            <td>Name:</td>
            <td>
                <asp:TextBox ID="AddCategoryName" runat="server" ValidationGroup="1"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="CategoryNameValidator" runat="server" ErrorMessage="*Required" Display="Dynamic" SetFocusOnError="True" ControlToValidate="AddCategoryName" ValidationGroup="1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td>
                <asp:TextBox ID="AddCategoryDescription" runat="server" ValidationGroup="1"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="CategoryDescriptionValidator" runat="server" ErrorMessage="*Required" Display="Dynamic" SetFocusOnError="True" ControlToValidate="AddCategoryDescription" ValidationGroup="1"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="AddCategoryButton" runat="server" Text="Add Category" ValidationGroup="1" OnClick="AddCategoryButton_Click" /></td>
            <td>
                <asp:Label ID="LabelAddCategoryStatus" runat="server" Text=""></asp:Label></td>
        </tr>
        </table>
    <table>
        <tr>
            <td>
                <h3>Add Product:</h3>
            </td>
        </tr>
        <tr>
            <td>Category:</td>
            <td>
                <asp:DropDownList ID="DropDownAddCategory" runat="server" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CategoryName" DataValueField="CategoryID"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:WebStoreCS %>" SelectCommand="SELECT [CategoryID], [CategoryName] FROM [Categories]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Name:</td>
            <td>
                <asp:TextBox ID="AddProductName" runat="server" ValidationGroup="2"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="ProductNameValidator" runat="server" ErrorMessage="*Required" Display="Dynamic" ControlToValidate="AddProductName" SetFocusOnError="True" ValidationGroup="2"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Description:</td>
            <td>
                <asp:TextBox ID="AddProductDescription" runat="server" ValidationGroup="2"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="ProductDescriptionValidator" runat="server" ErrorMessage="*Required" ControlToValidate="AddProductDescription" Display="Dynamic" SetFocusOnError="True" ValidationGroup="2"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td>
                <asp:TextBox ID="AddProductPrice" runat="server" ValidationGroup="2"></asp:TextBox></td>
            <td>
                <asp:RequiredFieldValidator ID="ProductPriceValidator" runat="server" ErrorMessage="*Required" ControlToValidate="AddProductPrice" Display="Dynamic" SetFocusOnError="True" ValidationGroup="2"></asp:RequiredFieldValidator></td>
        <td>
            <asp:RegularExpressionValidator ID="ProductPriceRegex" runat="server" ErrorMessage="Must be a valid price without $" ControlToValidate="AddProductPrice" Display="Dynamic" SetFocusOnError="True" ValidationExpression="^[0-9]*(\.)?[0-9]?[0-9]?$" ValidationGroup="2"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>Image File:</td>
            <td>
                <asp:FileUpload ID="ProductImage" runat="server" /></td>
            <td>
                <asp:RequiredFieldValidator ID="ProductImageValidator" runat="server" ErrorMessage="*Required" ControlToValidate="ProductImage" Display="Dynamic" SetFocusOnError="True" ValidationGroup="2"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td><asp:Button ID="AddProductButton" runat="server" Text="Add Product" OnClick="AddProductButton_Click" ValidationGroup="2" /></td>
            <td>
                <asp:Label ID="LabelAddProductStatus" runat="server" Text=""></asp:Label></td>
        </tr>
        </table>
    <table>
        <tr>
            <td><h3>Remove Product:</h3></td>
        </tr>
        <tr>
            <td>Product:</td>
            <td>
                <asp:DropDownList ID="DropDownRemoveProduct" runat="server"></asp:DropDownList></td>
        </tr>
        <tr>
         <td>
                <asp:Button ID="RemoveProductButton" runat="server" Text="Remove Product" /></td>
            <td>
                <asp:Label ID="RemoveProductStatus" runat="server" Text=""></asp:Label></td>
         </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
