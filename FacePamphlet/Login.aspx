<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FacePamphlet.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <asp:SqlDataSource ID="SqlDataSourceMembers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringFacePamphlet %>" 
        SelectCommand="SELECT [EMail] FROM [Members]"></asp:SqlDataSource>

    <asp:DropDownList ID="DropDownListMembers" runat="server" 
        DataSourceID="SqlDataSourceMembers" 
        DataTextField="EMail" 
        DataValueField="EMail">
    </asp:DropDownList>
    
    <br />
    <br />
    <asp:Button ID="SubmitButton" CssClass="button" runat="server" OnClick="SubmitButton_Click" Text="Submit" />
    
</asp:Content>
