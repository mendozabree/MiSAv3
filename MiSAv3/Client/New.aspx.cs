using Microsoft.AspNet.Identity;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;


namespace MiSAv3.Client
{
    public partial class New : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                TextBoxStart.Text = Convert.ToDateTime(Request.QueryString["start"]).ToString("M/d/yyyy HH:mm");
                TextBoxEnd.Text = Convert.ToDateTime(Request.QueryString["end"]).ToString("M/d/yyyy HH:mm");
            }
        }

        protected void ButtonOK_Click(object sender, EventArgs e)
        {
            DateTime start = Convert.ToDateTime(TextBoxStart.Text);
            DateTime end = Convert.ToDateTime(TextBoxEnd.Text);

            dbInsertEvent(start, end, Name.Text = Context.User.Identity.GetUserName());
            Modal.Close(this, "OK");
        }

        private void dbInsertEvent(DateTime start, DateTime end, string name)
        {
            
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("INSERT INTO [event] (eventstart, eventend, name) VALUES(@start, @end, @name)", con);
                //cmd.Parameters.AddWithValue("id", id);
                cmd.Parameters.AddWithValue("start", start);
                cmd.Parameters.AddWithValue("end", end);
                cmd.Parameters.AddWithValue("name", name);
                cmd.ExecuteNonQuery();
            }
        }

        protected void ButtonCancel_Click(object sender, EventArgs e)
        {
            Modal.Close(this);
        }

        
    }
}