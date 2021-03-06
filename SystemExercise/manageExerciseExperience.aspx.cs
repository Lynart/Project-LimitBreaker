﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class systemExercise_manageExerciseExperience : System.Web.UI.Page
{
    ExperienceManager expMngr = new ExperienceManager();
    SystemExerciseManager manager = new SystemExerciseManager();

    protected void Page_Load(object sender, EventArgs e)
    {
        HtmlGenericControl li = (HtmlGenericControl)this.Page.Master.FindControl("Ulnav").FindControl("liManageExerciseExperience");
        li.Attributes.Add("class", "active");

        

        viewExerciseExp.userControlEventHappened += new EventHandler(viewExerciseExp_userControlEventHappened);

        if (!Page.IsPostBack)
        {
            functionalityMultiView.ActiveViewIndex = 1;
            mngExerciseExpBtn.Enabled = true;
            mngUserExpBtn.Enabled = false;
            loadUserExpFields();
        }
    }

    private void viewExerciseExp_userControlEventHappened(object sender, EventArgs e)
    {
        loadExerciseExpFields();
        saveResultLbl.Text = "";
    }

    protected void saveExpBtn_Click(object sender, EventArgs e)
    {
        try
        {
            if (expMngr.modifyExerciseExpByName(viewExerciseExp.ddlValue, Convert.ToDouble(baseTxtBox.Text), Convert.ToDouble(weightTxtBox.Text), Convert.ToDouble(repTxtBox.Text), Convert.ToDouble(distanceTxtBox.Text), Convert.ToDouble(timeTxtBox.Text)))
                saveResultLbl.Text = "Exercise experience successfully modified!";
            else
                saveResultLbl.Text = "Something went wrong with the update and the exercise has not been modified...";
        }

        catch (Exception ex)
        {
            saveResultLbl.Text = "Something went wrong with the update and the exercise has not been modified: " + ex.Message;
        }

        loadExerciseExpFields();
    }

    protected void addExpBtn_Click(object sender, EventArgs e)
    {
        try
        {
            if (expMngr.createNewExerciseExp(viewExerciseExp.ddlValue, Convert.ToDouble(addBaseTxtBox.Text), Convert.ToDouble(addWeightTxtBox.Text), Convert.ToDouble(addRepTxtBox.Text), Convert.ToDouble(addDistanceTxtBox.Text), Convert.ToDouble(addTimeTxtBox.Text)))
                saveResultLbl.Text = "Exercise experience has been successfully added to the selected exercise!";
            else
                addResultLbl.Text = "Something went wrong with the adding of the exercise experience and it has not been added to the selected exercise...";
        }

        catch (Exception ex)
        {
            addResultLbl.Text = "Something went wrong with the adding of the exercise experience and it has not been added to the selected exercise: " + ex.Message;
        }

        loadExerciseExpFields();
    }
    
    protected void mngExerciseExpBtn_Click(object sender, EventArgs e)
    {
        mngExerciseExpBtn.Enabled = false;
        mngUserExpBtn.Enabled = true;
        functionalityMultiView.ActiveViewIndex = 0;
        loadExerciseExpFields();
        viewExerciseExp.colorCodeExercises();
    }

    protected void mngUserExpBtn_Click(object sender, EventArgs e)
    {
        mngUserExpBtn.Enabled = false;
        mngExerciseExpBtn.Enabled = true;
        functionalityMultiView.ActiveViewIndex = 1;
        saveAtrophyResultLbl.Text = "";
        saveLvlFormulaResultLbl.Text = "";
        loadUserExpFields();
    }

    protected void saveAtrophyBtn_Click(object sender, EventArgs e)
    {
        try
        {
            if (expMngr.modifyExperienceAtrophy(Convert.ToInt32(inactiveTimeTxtBox.Text), Convert.ToInt32(expLossTxtBox.Text)))
                saveAtrophyResultLbl.Text = "Experience atrophy has been successfully modified!";
            else
                saveAtrophyResultLbl.Text = "Something went wrong with the modifying of expereince atrophy...";
        }

        catch (Exception ex)
        {
            saveAtrophyResultLbl.Text = "Something went wrong with the modifying of expereince atrophy: " + ex.Message;
        }

        saveLvlFormulaResultLbl.Text = "";
        loadUserExpFields();
    }

    protected void saveLvlFormulaBtn_Click(object sender, EventArgs e)
    {
        try
        {
            if (expMngr.modifyLevelFormula(Convert.ToInt32(maxLvlTxtBox.Text), Convert.ToDouble(expModTxtBox.Text), Convert.ToInt32(baseReqTxtBox.Text)))
                saveLvlFormulaResultLbl.Text = "The level formula has been successfully modified!";
            else
                saveLvlFormulaResultLbl.Text = "Something went wrong with the modifying of the level formula...";
        }

        catch (Exception ex)
        {
            saveLvlFormulaResultLbl.Text = "Something went wrong with the modifying of the level formula: " + ex.Message;
        }

        saveAtrophyResultLbl.Text = "";
        loadUserExpFields();
    }

    protected void loadExerciseExpFields()
    {
        if (viewExerciseExp.ddlCount != 0)
        {
            manageExperienceMultiView.ActiveViewIndex = 1;
            ExerciseExp selectedExercise = expMngr.getExerciseExpByExerciseName(viewExerciseExp.ddlValue);
            Exercise exercise = manager.getExercise(viewExerciseExp.ddlValue);
            viewExerciseExp.ddle = true;
            try
            {
                baseTxtBox.Text = selectedExercise.baseExperience.ToString();

                if (exercise.time)
                {
                    NumericUpDownExtender2.Enabled = true;
                    timeTxtBox.Enabled = true;
                    timeTxtBox.Text = selectedExercise.timeModifier.ToString();
                    
                }
                else
                {
                    NumericUpDownExtender2.Enabled = false;
                    timeTxtBox.Enabled = false;
                    timeTxtBox.Text = "0";
                    
                }

                if (exercise.weight)
                {
                    NumericUpDownExtender3.Enabled = true;
                    weightTxtBox.Enabled = true;
                    weightTxtBox.Text = selectedExercise.weightModifier.ToString();
                }
                else
                {
                    NumericUpDownExtender3.Enabled = false;
                    weightTxtBox.Enabled = false;
                    weightTxtBox.Text = "0";
                }

                if (exercise.rep)
                {
                    NumericUpDownExtender4.Enabled = true;
                    repTxtBox.Enabled = true;
                    repTxtBox.Text = selectedExercise.repModifier.ToString();
                }
                else
                {
                    NumericUpDownExtender4.Enabled = false;
                    repTxtBox.Enabled = false;
                    repTxtBox.Text = "0";
                }

                if (exercise.distance)
                {
                    NumericUpDownExtender5.Enabled = true;
                    distanceTxtBox.Enabled = true;
                    distanceTxtBox.Text = selectedExercise.distanceModifier.ToString();
                }
                else
                {
                    NumericUpDownExtender5.Enabled = false;
                    distanceTxtBox.Enabled = false;
                    distanceTxtBox.Text = "0";
                }
            }

            catch (Exception ex)
            {
                //noExpLbl.Text = ex.Message + Environment.NewLine + ex.StackTrace;
                manageExperienceMultiView.ActiveViewIndex = 2;
                
                addBaseTxtBox.Text = "0";
                addTimeTxtBox.Text = "0";
                addWeightTxtBox.Text = "0";
                addRepTxtBox.Text = "0";
                addDistanceTxtBox.Text = "0";

                if (exercise.time)
                {
                    NumericUpDownExtender7.Enabled = true;
                    addTimeTxtBox.Enabled = true;
                }
                else
                {
                    NumericUpDownExtender7.Enabled = false;
                    addTimeTxtBox.Enabled = false;
                }

                if (exercise.weight)
                {
                    NumericUpDownExtender8.Enabled = true;
                    addWeightTxtBox.Enabled = true;
                }
                else
                {
                    NumericUpDownExtender8.Enabled = false;
                    addWeightTxtBox.Enabled = false;
                }

                if (exercise.rep)
                {
                    NumericUpDownExtender9.Enabled = true;
                    addRepTxtBox.Enabled = true;
                }
                else
                {
                    NumericUpDownExtender9.Enabled = false;
                    addRepTxtBox.Enabled = false;
                }

                if (exercise.distance)
                {
                    NumericUpDownExtender10.Enabled = true;
                    addDistanceTxtBox.Enabled = true;
                }
                else
                {
                    NumericUpDownExtender10.Enabled = false;
                    addDistanceTxtBox.Enabled = false;
                }
            }
        }

        else
        {
            //DropDownList ddle = new DropDownList();
            viewExerciseExp.ddle = false;
            manageExperienceMultiView.ActiveViewIndex = 0;
        }

    }

    protected void loadUserExpFields()
    {
        try
        {
            ExperienceAtrophy expAtrphy = expMngr.getExperienceAtrophy();
            expLossTxtBox.Text = expAtrphy.baseLoss.ToString();
            inactiveTimeTxtBox.Text = expAtrphy.graceDays.ToString();
        }

        catch (Exception ex)
        {
            saveAtrophyResultLbl.Text = "Something went wrong with retrieving values from the database: " + ex.Message;
            expLossTxtBox.Text = "0";
            inactiveTimeTxtBox.Text = "0";
        }

        try
        {
            LevelFormula lvlForm = expMngr.getLevelFormulaValues();
            maxLvlTxtBox.Text = lvlForm.maxLevel.ToString();
            baseReqTxtBox.Text = lvlForm.baseRequired.ToString();
            expModTxtBox.Text = lvlForm.expModifier.ToString();
        }

        catch (Exception ex)
        {
            saveLvlFormulaResultLbl.Text = "Something went wrong with retrieving values from the database: " + ex.Message;
            maxLvlTxtBox.Text = "0";
            baseReqTxtBox.Text = "0";
            expModTxtBox.Text = "0";
        }
    }
}