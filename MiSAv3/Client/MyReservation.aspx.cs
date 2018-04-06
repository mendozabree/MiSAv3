using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using DayPilot.Utils;
using DayPilot.Web.Ui;
using DayPilot.Web.Ui.Data;
using DayPilot.Web.Ui.Enums;
using DayPilot.Web.Ui.Events;

using System.Web.UI.WebControls;

namespace MiSAv3.Client
{
    public partial class MyReservation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DayPilotCalendarDay.DataSource = GetData(DayPilotCalendarDay.StartDate, DayPilotCalendarDay.EndDate.AddDays(1));
                DayPilotCalendarDay.DataBind();
            }

        }

        protected void DayPilotCalendarDay_Command(object sender, DayPilot.Web.Ui.Events.CommandEventArgs e)
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

        protected void DayPilotCalendarWeek_Command(object sender, DayPilot.Web.Ui.Events.CommandEventArgs e)
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

        protected void DayPilotMonth1_Command(object sender, DayPilot.Web.Ui.Events.CommandEventArgs e)
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
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM [event] WHERE NOT (([eventend] <= @start) OR ([eventstart] >= @end))", ConfigurationManager.ConnectionStrings["daypilot"].ConnectionString);
            da.SelectCommand.Parameters.AddWithValue("start", start);
            da.SelectCommand.Parameters.AddWithValue("end", end);

            DataTable dt = new DataTable();
            da.Fill(dt);

            return dt;
        }
    }
}