using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MiSAv3.Admin
{
    public partial class SetUpExperiment : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["misa"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SaveBtnClick(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlcmd = new SqlCommand("ExperimentCreateOrUpdate", sqlCon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@ExperimentID", (hfExperimentID.Value == "" ? 0 : Convert.ToInt32(hfExperimentID.Value)));
            sqlcmd.Parameters.AddWithValue("@ExperimentTitle", ExperimentTitle.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@ExperimentAuthor", Author.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@AuthorEmail", Help.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Programme", Programme.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@StudyYear", Year.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@CourseUnit", CourseUnit.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@ExperimentStatus", ExperimentStatus.SelectedItem.Value);
            sqlcmd.ExecuteNonQuery();
            sqlCon.Close();
            Clear();
        }

        public void Clear()
        {
            hfExperimentID.Value = "";
            ExperimentTitle.Text = Author.Text = Help.Text = Programme.Text = Year.Text = CourseUnit.Text = "";
        }
    }
}