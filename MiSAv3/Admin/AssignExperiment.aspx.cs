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
    public partial class AssignExperiment : System.Web.UI.Page
    {
        SqlConnection sqlCon = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        //On Page Load show all assignments
        protected void Page_Load(object sender, EventArgs e)
        {
            FillAssignmentsgv();
        }

        //Saving Changes after new assignment or Updating existing assignment
        protected void AssignButton_Click(object sender, EventArgs e)
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlcmd = new SqlCommand("NewAssignmentOrUpdate", sqlCon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@AssignmentID", (hfAssignmentID.Value == "" ? 0 : Convert.ToInt32(hfAssignmentID.Value)));
            sqlcmd.Parameters.AddWithValue("@University", UniversityTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@Course", CourseTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@YearOfStudy", YearTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@CourseUnit", CourseUnitTextBox.Text.Trim());
            sqlcmd.Parameters.AddWithValue("@ExperimentID", ExperimentIDTextBox.Text.Trim());
            sqlcmd.ExecuteNonQuery();
            sqlCon.Close();
            Clear();

            AssignmentsGridView.Visible = true;
            AssignmentDetailsPanel.Visible = false;

            FillAssignmentsgv();
        }

        //Opening the assignment details to create a new assignment
        protected void NewAssignmentButton_Click(object sender, EventArgs e)
        {
            AssignmentsGridView.Visible = false;
            AssignmentDetailsPanel.Visible = true;
            AssignButton.Text = "Assign";
        }

        //Editing a particular assignment from the gridview
        protected void EditlnkView_Click(object sender, EventArgs e)
        {
            AssignmentsGridView.Visible = false;
            AssignmentDetailsPanel.Visible = true;

            int assignmentID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewAssignmentByID", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            sqlDa.SelectCommand.Parameters.AddWithValue("@AssignmentID", assignmentID);
            DataTable dtbl = new DataTable();
            sqlDa.Fill(dtbl);
            sqlCon.Close();
            //Fill Table
            hfAssignmentID.Value = assignmentID.ToString();
            ExperimentIDTextBox.Text = dtbl.Rows[0]["ExperimentID"].ToString();
            UniversityTextBox.Text = dtbl.Rows[0]["University"].ToString();
            CourseTextBox.Text = dtbl.Rows[0]["Course"].ToString();
            YearTextBox.Text = dtbl.Rows[0]["YearOfStudy"].ToString();
            CourseUnitTextBox.Text = dtbl.Rows[0]["CourseUnit"].ToString();

            AssignButton.Text = "Update";
        }

        //Deleting an assignment
        protected void DeletelnkView_Click(object sender, EventArgs e)
        {
            int assignmentID = Convert.ToInt32((sender as LinkButton).CommandArgument);
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlCommand sqlcmd = new SqlCommand("DeleteAssignmentByID", sqlCon);
            sqlcmd.CommandType = CommandType.StoredProcedure;
            sqlcmd.Parameters.AddWithValue("@AssignmentID", assignmentID);
            sqlcmd.ExecuteNonQuery();
            sqlCon.Close();

            FillAssignmentsgv();
            AssignmentDetailsPanel.Visible = false;
            AssignmentsGridView.Visible = true;
        }

        //Clear the assignment details panel
        public void Clear()
        {
            hfAssignmentID.Value = "";
            UniversityTextBox.Text = CourseTextBox.Text = CourseUnitTextBox.Text = YearTextBox.Text = ExperimentIDTextBox.Text = "";
        }

        //Filling the assignment table to view all assignments
        void FillAssignmentsgv()
        {
            if (sqlCon.State == ConnectionState.Closed)
                sqlCon.Open();
            SqlDataAdapter sqlDa = new SqlDataAdapter("ViewAllAssignments", sqlCon);
            sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
            DataTable dtbl1 = new DataTable();
            sqlDa.Fill(dtbl1);
            sqlCon.Close();
            gv.DataSource = dtbl1;
            gv.DataBind();
        }
    }
}