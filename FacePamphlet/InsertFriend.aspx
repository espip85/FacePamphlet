<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InsertFriend.aspx.cs" Inherits="FacePamphlet.InsertFriend" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="SqlDataSourceFriends" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringFacePamphlet %>" 
        InsertCommand="INSERT INTO [Friends] ([MyEMail], [FriendEmail]) VALUES (@MyEMail, @FriendEmail)">
        <InsertParameters>
            <asp:Parameter Name="MyEMail" Type="String" />
            <asp:Parameter Name="FriendEmail" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSourceMembers" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionStringFacePamphlet %>" 
        SelectCommand="SELECT Members.EMail,CONCAT(Members.FirstName, ' ', Members.LastName) 
        AS MemberName 
        FROM Members
         WHERE (NOT (Members.EMail LIKE @EMail)) 
        AND (NOT (Members.EMail IN (SELECT FriendEmail FROM Friends WHERE (MyEMail LIKE @EMail))))">
        <SelectParameters>
            <asp:QueryStringParameter Name="EMail" QueryStringField="email" />
        </SelectParameters>
    </asp:SqlDataSource>
    
    <asp:DropDownList ID="DropDownListFriendSuggestion" runat="server" 
        DataValueField="Email" 
        DataSourceID="SqlDataSourceMembers" 
        DataTextField="MemberName"></asp:DropDownList>



    <br />
    <br />
    <asp:Button ID="ButtonAddFriend" CssClass="button" runat="server" Text="Click here to add this new friend" OnClick="Button1_Click" />



    <br />
    <br />
    <asp:Button ID="ButtonCancel" CssClass="button" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" />



</asp:Content>
