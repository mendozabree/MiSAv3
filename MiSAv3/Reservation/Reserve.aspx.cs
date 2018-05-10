﻿using DayPilot.Web.Ui.Events;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace MiSAv3.Reservation
{
    public partial class Reserve : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DayPilotCalendarDay.DataSource = GetData(DayPilotCalendarDay.StartDate, DayPilotCalendarDay.EndDate.AddDays(1));
                DayPilotCalendarDay.DataBind();
                string expId = (string)(Session["epid"]);
                ExperimentLabel.Text = expId;
                int ExperimentID = Convert.ToInt32(ExperimentLabel.Text);
            }

        }

        protected void DayPilotCalendarDay_Command(object sender, CommandEventArgs e)
        {
            switch (e.Command)
            {
                case "navigate":
                    DayPilotCalendarDay.StartDate = (DateTime)e.Data["day"];
                    DayPilotCalendarDay.DataSource = GetData(DayPilotCalendarDay.StartDate, DayPilotCalendarDay.EndDate.AddDays(1));
                    DayPilotCalendarDay.DataBind();
                    DayPilotCalendarDay.Update();
                    break;
                case "refresh":
                    DayPilotCalendarDay.DataSource = GetData(DayPilotCalendarDay.StartDate, DayPilotCalendarDay.EndDate.AddDays(1));
                    DayPilotCalendarDay.DataBind();
                    DayPilotCalendarDay.Update();
                    break;
            }
        }

        protected void DayPilotCalendarWeek_Command(object sender, CommandEventArgs e)
        {
            switch (e.Command)
            {
                case "navigate":
                    DayPilotCalendarWeek.StartDate = (DateTime)e.Data["day"];
                    DayPilotCalendarWeek.DataSource = GetData(DayPilotCalendarWeek.StartDate, DayPilotCalendarWeek.EndDate.AddDays(1));
                    DayPilotCalendarWeek.DataBind();
                    DayPilotCalendarWeek.Update();
                    break;
                case "refresh":
                    DayPilotCalendarWeek.DataSource = GetData(DayPilotCalendarWeek.StartDate, DayPilotCalendarWeek.EndDate.AddDays(1));
                    DayPilotCalendarWeek.DataBind();
                    DayPilotCalendarWeek.Update();
                    break;
            }
        }

        protected void DayPilotMonth1_Command(object sender, CommandEventArgs e)
        {
            switch (e.Command)
            {
                case "navigate":
                    DayPilotMonth1.StartDate = (DateTime)e.Data["day"];
                    DayPilotMonth1.DataSource = GetData(DayPilotMonth1.VisibleStart, DayPilotMonth1.VisibleEnd);
                    DayPilotMonth1.DataBind();
                    DayPilotMonth1.Update();
                    break;
                case "refresh":
                    DayPilotMonth1.DataSource = GetData(DayPilotMonth1.VisibleStart, DayPilotMonth1.VisibleEnd);
                    DayPilotMonth1.DataBind();
                    DayPilotMonth1.Update();
                    break;
            }
        }


        private DataTable GetData(DateTime start, DateTime end)
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [event] WHERE NOT (([eventend] <= @start) OR ([eventstart] >= @end))", ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
            da.SelectCommand.Parameters.AddWithValue("start", start);
            da.SelectCommand.Parameters.AddWithValue("end", end);

            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
    }
}