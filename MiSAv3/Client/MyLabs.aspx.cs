using System;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using MiSAv3.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiSAv3.Client
{
    public partial class MyLabs : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

 

        protected void Reserve_Click(object sender, EventArgs e)
        {

            ViewExperimentsPanel.Visible = false;
            
        }

        protected void ViewLabsButton_Click(object sender, EventArgs e)
        {
            AvailableLabsPanel.Visible = true;
            LabsFilterPanel.Visible = false;

            LabsFilter();
        }

        public void LabsFilter()
        {
            string university = Insititution.Text;
            string course = Programme.Text;
            string year = YearOfStudy.SelectedItem.Value;
            string courseUnit = CourseUnitCode.Text;

            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand cmd = new SqlCommand("LabsFilter", sqlCon);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            sda.SelectCommand.Parameters.AddWithValue("@University", university);
            sda.SelectCommand.Parameters.AddWithValue("@Course", course);
            sda.SelectCommand.Parameters.AddWithValue("@YearOfStudy", year);
            sda.SelectCommand.Parameters.AddWithValue("@CourseUnit", courseUnit);
            DataTable dtbl = new DataTable();
            sda.Fill(dtbl);
            sqlCon.Close();

            Experimentsgv.DataSource = dtbl;
            Experimentsgv.DataBind();
        }
    }
}