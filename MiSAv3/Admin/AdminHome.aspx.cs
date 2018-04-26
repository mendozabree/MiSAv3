using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MiSAv3.Admin
{
    public partial class AdminHome : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }

        protected void lnkView_Click(object sender, EventArgs e)
        {
            ExperimentDetailsPanel.Visible = true;
            GridView.Visible = false;
            int experimentID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewExperimentByID", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@ExperimentID", experimentID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            hfExperimentID.Value = experimentID.ToString();
            AdminExpTitle.Text = dtbl.Rows[0]["Title"].ToString();
            AdminAuthor.Text = dtbl.Rows[0]["Author"].ToString();
            AdminHelp.Text = dtbl.Rows[0]["AuthorEmail"].ToString();
            Programme.Text = dtbl.Rows[0]["Programme"].ToString();
            Year.Text = dtbl.Rows[0]["StudyYear"].ToString();
            CourseUnit.Text = dtbl.Rows[0]["CourseUnit"].ToString();
            ExperimentStatus.SelectedItem.Value = dtbl.Rows[0]["ExperimentStatus"].ToString();
            BtnSaveChanges.Text = "Update";


        }

        protected void OnSaveChangesBtnClick(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlcmd = new SqlCommand("ExperimentCreateOrUpdate", sqlCon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@ExperimentID", (hfExperimentID.Value == "" ? 0 : Convert.ToInt32(hfExperimentID.Value)));
            sqlcmd.Parameters.AddWithValue("@ExperimentTitle", AdminExpTitle.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@ExperimentAuthor", AdminAuthor.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@AuthorEmail", AdminHelp.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Programme", Programme.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@StudyYear", Year.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@CourseUnit", CourseUnit.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@ExperimentStatus", ExperimentStatus.SelectedItem.Value);
            sqlcmd.ExecuteNonQuery();
            sqlCon.Close();
            ExperimentDetailsPanel.Visible = false;
            GridView.Visible = true;

            FillGridView();





            /*UserExpTitle.Text = AdminExpTitle.Text;
            UserAuthor.Text = AdminAuthor.Text;
            UserHelp.Text = AdminHelp.Text;*/
        }

        void FillGridView()
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewAllExperiments", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            gv.DataSource = dtbl;
            gv.DataBind();
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlcmd = new SqlCommand("DeleteExperimentByID", sqlCon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@ExperimentID", Convert.ToInt32(hfExperimentID.Value));
            sqlcmd.ExecuteNonQuery();
            sqlCon.Close();
            ExperimentDetailsPanel.Visible = false;
            GridView.Visible = true;

            FillGridView();
        }
    }
}