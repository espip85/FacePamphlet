using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FacePamphlet
{
    public partial class InsertPost : System.Web.UI.Page
    {
        String Email;

        protected void Page_Load(object sender, EventArgs e)
        {
            Email = Request.QueryString["Email"];
        }

        protected void ButtonSumbit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                DateTime date = DateTime.Now;
                String post = TextBoxPost.Text;

                SqlDataSourceFacePamphlet.InsertParameters.Clear();
                SqlDataSourceFacePamphlet.InsertParameters.Add("EMail", Email);
                SqlDataSourceFacePamphlet.InsertParameters.Add("Post", post);
                SqlDataSourceFacePamphlet.InsertParameters.Add("PostDate", date.ToString());

                SqlDataSourceFacePamphlet.Insert();

                Response.Redirect("MemberHome.aspx?Email=" + Email);
            }
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberHome.aspx?Email=" + Email);
        }
    }
}