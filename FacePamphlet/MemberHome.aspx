<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="MemberHome.aspx.cs" Inherits="FacePamphlet.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <asp:Button ID="LogoutButton" CssClass="button" runat="server" Text="Logout" OnClick="LogoutButton_Click" />

    <asp:SqlDataSource ID="SqlDataSourceFacePamphletMember" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringFacePamphlet %>" SelectCommand="SELECT EMail, FirstName, FirstName + ' ' + LastName AS MemberName FROM Members WHERE (EMail = @EMail)">
        <SelectParameters>
            <asp:QueryStringParameter Name="EMail" QueryStringField="Email" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <br />
    <div>
        <asp:DetailsView ID="DetailsViewMember" CssClass="info" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="EMail" DataSourceID="SqlDataSourceFacePamphletMember" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="MemberName" HeaderText="MemberName" ReadOnly="True" SortExpression="MemberName" />
                <asp:ImageField DataImageUrlFormatString="~/Images/{0}.jpg" DataImageUrlField="FirstName">
                </asp:ImageField>
                <asp:BoundField DataField="EMail" HeaderText="EMail" ReadOnly="True" SortExpression="EMail" />
            </Fields>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <HeaderTemplate>
                Member Page
            </HeaderTemplate>
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
        </asp:DetailsView>
    </div>

    <br />
    <br />

    <asp:SqlDataSource ID="SqlDataSourceFacePamphletPosts" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringFacePamphlet %>" SelectCommand="SELECT [Post], [PostDate] FROM [Posts] WHERE ([EMail] = @EMail) ORDER BY [PostDate] DESC">
        <SelectParameters>
            <asp:QueryStringParameter Name="EMail" QueryStringField="Email" Type="String" />
        </SelectParameters>

    </asp:SqlDataSource>

    <div>
        <asp:GridView ID="GridViewPosts" CssClass="info" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceFacePamphletPosts" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="PostDate" HeaderText="Post Date" SortExpression="PostDate" DataFormatString="{0:dd/MM/yyyy}" />
                <asp:BoundField DataField="Post" HeaderText="Current Posts" SortExpression="Post" />
            </Columns>
            <EmptyDataTemplate>
                No posts!
            </EmptyDataTemplate>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>

    <br />
    <br />
    <asp:Button ID="ButtonAddPost" CssClass="button" runat="server" Text="Click here to add a post" OnClick="ButtonAddPost_Click" />


    <asp:SqlDataSource ID="SqlDataSourceFacePamphletFriends" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringFacePamphlet %>" SelectCommand="SELECT Friends.MyEMail, Friends.FriendEmail, Members.FirstName, Members.FirstName + ' ' + Members.LastName AS MemberName FROM Friends INNER JOIN Members ON Friends.FriendEmail = Members.EMail AND Friends.MyEMail = @EMail">
        <SelectParameters>
            <asp:QueryStringParameter Name="EMail" QueryStringField="Email" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <br />

    <div>
        <asp:GridView ID="GridViewFriends" CssClass="info" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSourceFacePamphletFriends" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:HyperLinkField DataTextField="MemberName" HeaderText="Click below to view a friend's info" Text="MemberName" DataNavigateUrlFields="MyEMail,FriendEmail" DataNavigateUrlFormatString="FriendInfo.aspx?Email={0}&amp;FriendEmail={1}" />
                <asp:BoundField DataField="FriendEmail" HeaderText="E-Mail" />
                <asp:ImageField DataImageUrlField="FirstName" DataImageUrlFormatString="~/Images/{0}.jpg" HeaderText="Photos">
                </asp:ImageField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>

    <br />
    <br />
    <asp:Button ID="ButtonAddFriend" CssClass="button" runat="server" Text="Click here to add a friend" OnClick="ButtonAddFriend_Click" />


</asp:Content>
