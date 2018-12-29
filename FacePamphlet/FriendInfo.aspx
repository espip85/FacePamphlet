<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="FriendInfo.aspx.cs" Inherits="FacePamphlet.FriendInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Button ID="ButtonSubmit" CssClass="button" runat="server" Text="Click here to return to your Face Pamphlet Homepage" OnClick="ButtonSubmit_Click" />

    <asp:SqlDataSource ID="SqlDataSourceMember" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringFacePamphlet %>" SelectCommand="SELECT EMail, FirstName, CONCAT(FirstName, ' ', LastName) AS MemberName FROM Members WHERE (EMail LIKE @FriendEmail)">
        <SelectParameters>
            <asp:QueryStringParameter Name="FriendEmail" QueryStringField="FriendEmail" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <asp:DetailsView ID="DetailsViewMember" CssClass="info" runat="server" Height="50px" Width="400px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" DataSourceID="SqlDataSourceMember" AutoGenerateRows="False" DataKeyNames="EMail">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <Fields>
            <asp:ImageField DataImageUrlFormatString="~/Images/{0}.jpg" DataImageUrlField="FirstName">
            </asp:ImageField>
        </Fields>
        <FooterStyle BackColor="#CCCC99" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <HeaderTemplate>
            <%#Eval("MemberName") %>&#39;s Info Page
        </HeaderTemplate>
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <RowStyle BackColor="#F7F7DE" />
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSourcePost" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringFacePamphlet %>" 
        SelectCommand="SELECT [Post], [PostDate] FROM [Posts] WHERE ([EMail] = @EMail)">
        <SelectParameters>
            <asp:QueryStringParameter Name="EMail" QueryStringField="FriendEmail" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <br />
    <asp:GridView ID="GridViewPosts" CssClass="info" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourcePost" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="PostDate" HeaderText="Post Date" SortExpression="PostDate" DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="Post" HeaderText="Current Posts" SortExpression="Post" />
        </Columns>
        <EmptyDataTemplate>
            Currently has no posts
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

    <asp:SqlDataSource ID="SqlDataSourceFriend" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStringFacePamphlet %>" SelectCommand="SELECT Friends.MyEMail, Friends.FriendEmail, Members.FirstName, Members.FirstName + ' ' + Members.LastName AS MemberName FROM Friends INNER JOIN Members ON Friends.FriendEmail = Members.EMail WHERE (Friends.MyEMail LIKE @EMail)">
        <SelectParameters>
            <asp:QueryStringParameter Name="EMail" QueryStringField="FriendEmail" />
        </SelectParameters>
    </asp:SqlDataSource>

    <br />
    <br />
        <asp:GridView ID="GridViewFriend" CssClass="info" runat="server" ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" DataSourceID="SqlDataSourceFriend" CellPadding="4" ForeColor="Black" GridLines="Vertical" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="MemberName" HeaderText="Friends" />
            <asp:ImageField DataImageUrlField="FirstName" DataImageUrlFormatString="~/Images/{0}.jpg" HeaderText="Photos">
            </asp:ImageField>
        </Columns>
        <EmptyDataTemplate>
            Currently has no friends
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

</asp:Content>
