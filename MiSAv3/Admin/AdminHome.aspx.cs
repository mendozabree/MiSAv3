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

        //View all experiments on page load
        protected void Page_Load(object sender, EventArgs e)
        {
            FillExperimentsgv();
        }

        //View Experiment By ID to Update details
        protected void lnkView_Click(object sender, EventArgs e)
        {
            ExperimemtDetailsPanel.Visible = true;
            ExperimentsGridView.Visible = false;

            int experimentID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewExperimentByID", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@ExperimentID", experimentID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            //Fill Experiment Details form
            hfExperimentID.Value = experimentID.ToString();
            ExperimentTitleTextBox.Text = dtbl.Rows[0]["ExperimentTitle"].ToString();
            ManualTextBox.Text = dtbl.Rows[0]["LabManual"].ToString();
            ContactEmailTextBox.Text = dtbl.Rows[0]["ContactEmail"].ToString();
            LabLinkTextBox.Text = dtbl.Rows[0]["LabLink"].ToString();
            ExperimentStatus.SelectedItem.Value = dtbl.Rows[0]["ExperimentStatus"].ToString();
            SaveBtn.Text = "Update";
        }

        //Storing changes based on modifying experiments details
        protected void OnSaveChangesBtnClick(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlcmd = new SqlCommand("ExperimentCreateOrUpdate", sqlCon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@ExperimentID", (hfExperimentID.Value == "" ? 0 : Convert.ToInt32(hfExperimentID.Value)));
            sqlcmd.Parameters.AddWithValue("@ExperimentTitle", ExperimentTitleTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@LabManual", ManualTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@ContactEmail", ContactEmailTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@LabLink", LabLinkTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@ExperimentStatus", ExperimentStatus.SelectedItem.Value);
            sqlcmd.ExecuteNonQuery();
            sqlCon.Close();

            ExperimemtDetailsPanel.Visible = false;
            ExperimentsGridView.Visible = true;

            FillExperimentsgv();
        }

        //Fill Experiments Grid 
        void FillExperimentsgv()
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


        //Delete Entire Experiment
        protected void DeleteExperiment_Click(object sender, EventArgs e)
        {
            int experimentID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlcmd = new SqlCommand("DeleteExperimentByID", sqlCon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@ExperimentID", experimentID);
            sqlcmd.ExecuteNonQuery();
            sqlCon.Close();
            ExperimemtDetailsPanel.Visible = false;
            ExperimentsGridView.Visible = true;

            FillExperimentsgv();
        }

        //View experiment form for new experiment
        protected void NewExperiment_Click(object sender, EventArgs e)
        {
            ExperimemtDetailsPanel.Visible = true;
            ExperimentsGridView.Visible = false;
        }
    }
}