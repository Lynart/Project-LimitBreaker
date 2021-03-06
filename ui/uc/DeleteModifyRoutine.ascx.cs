﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class ui_uc_DeleteModifyRoutine : System.Web.UI.UserControl
{
    public int userID { get; set; }
    ListBox lb;
    SystemExerciseManager sysManager;
    routineManager routManager;

    protected void Page_Load(object sender, EventArgs e)
    {
        sysManager = new SystemExerciseManager();
        routManager = new routineManager();
        lb = (ListBox)this.Parent.FindControl("lbRoutines");
        if (!IsPostBack)
        {
            pnlDescription.Visible = false;
            lblUniqueName.Visible = false;
        }
        if (lb != null && lb.SelectedIndex > -1)
        {
            GridView1.DataSource = routManager.getExerciseFromRoutine(Convert.ToInt32(lb.SelectedItem.Value));
            GridView1.DataBind();
            Panel1.Visible = true;
            Panel1.Enabled = true;
            //Response.Write(rbl.SelectedIndex + " item: " + rbl.SelectedItem);

            // to get the id of the button so that enter = submit
            tbRoutineName.Attributes.Add("onKeyPress",
                 "doClick('" + btnConfirm.ClientID + "',event)");
        }

    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        e.ExceptionHandled = true;
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            //Response.Write("item: "+ e.CommandArgument.ToString());
            int routineID = Convert.ToInt32(lb.SelectedItem.Value);
            int exerciseID = Convert.ToInt32(e.CommandArgument.ToString());
            Routine rtn = routManager.removeExerciseFromRoutine(routineID, exerciseID);

            if (rtn != null)
            {
                GridView1.DataSource = routManager.getExerciseFromRoutine(Convert.ToInt32(lb.SelectedItem.Value));
                GridView1.DataBind();
            }
        }
        else if (e.CommandName == "view")
        {
        }
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        int routineID = Convert.ToInt32(lb.SelectedItem.Value);
        Routine rtn = routManager.changeRoutineName(routineID, tbRoutineName.Text);
        int index = lb.SelectedIndex;
        if (rtn != null)
        {
            lb = (ListBox)this.Parent.FindControl("lbRoutines");
            lb.DataSource = routManager.getUsersRoutines(userID).ToList();
            lb.DataTextField = "name";
            lb.DataValueField = "id";
            lb.DataBind();
            lb.SelectedIndex = index;
            lblUniqueName.Visible = false;
        }
        else
            lblUniqueName.Visible = true;
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        int routineID = Convert.ToInt32(lb.SelectedItem.Value);
        int exerciseID = sysManager.getExerciseID(lbExerciseList.SelectedItem.Text);
        Routine rtn = routManager.addExerciseToRoutine(routineID, exerciseID);

        if (rtn != null)
        {
            GridView1.DataSource = routManager.getExerciseFromRoutine(Convert.ToInt32(lb.SelectedItem.Value));
            GridView1.DataBind();
        }
    }

    protected void okButton_Click(object sender, EventArgs e)
    {
        bool rc = false;
        if (lb != null && lb.SelectedIndex > -1)
        {
            try
            {

                rc = routManager.deleteRoutine(Convert.ToInt32(lb.SelectedItem.Value));
            }
            catch (NullReferenceException ex)
            {
                Console.WriteLine(ex.Message + Environment.NewLine + ex.StackTrace);
                // write off the execeptions to my error.log file
                StreamWriter wrtr = new StreamWriter(System.Web.HttpContext.Current.ApplicationInstance.Server.MapPath("~/assets/documents/" + @"\" + "error.log"), true);

                wrtr.WriteLine(DateTime.Now.ToString() + " | Error: " + ex);

                wrtr.Close();
            }
        }
        if (rc )
        {
            // redirect page to itself (refresh)
            Response.Redirect(Request.RawUrl);
        }
    }
    protected void lbExerciseList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (lbExerciseList.SelectedIndex > -1)
        {
            Exercise exerciseItem = new Exercise();
            exerciseItem = sysManager.getExercise(lbExerciseList.SelectedItem.Text);
            if (exerciseItem != null)
            {
                pnlDescription.Visible = true;
                lblDescription.Text = !exerciseItem.description.Trim().Equals("") ? exerciseItem.description.Trim() : "No Description";
                lblEquipment.Text = !exerciseItem.equipment.Trim().ToLower().Equals("none") ? exerciseItem.equipment.Replace(" ", "<br />") : "No Equipment";
            }
            else
                pnlDescription.Visible = false;
        }
    }
}