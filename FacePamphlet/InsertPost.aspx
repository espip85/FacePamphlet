<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="InsertPost.aspx.cs" Inherits="FacePamphlet.InsertPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSourceFacePamphlet" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringFacePamphlet %>" InsertCommand="INSERT INTO [Posts] ([EMail], [Post], [PostDate]) VALUES (@EMail, @Post, @PostDate)">
        <InsertParameters>
            <asp:Parameter Name="EMail" Type="String" />
            <asp:Parameter Name="Post" Type="String" />
            <asp:Parameter Name="PostDate" Type="DateTime" />
        </InsertParameters>
    </asp:SqlDataSource>
    <div>
        <asp:TextBox ID="TextBoxPost" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="A post cannot be blank" ControlToValidate="TextBoxPost" Display="Dynamic" ForeColor="Maroon"></asp:RequiredFieldValidator>

        <br />
        <br />

        <asp:Button ID="ButtonSumbit" CssClass="button" runat="server" Text="Submit the Post" OnClick="ButtonSumbit_Click" />

        <br />
        <br />

        <asp:Button ID="ButtonCancel" CssClass="button" runat="server" Text="Cancel" OnClick="ButtonCancel_Click" CausesValidation="False" />
   </div>
</asp:Content>
