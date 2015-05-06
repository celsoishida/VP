using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Text;
using System.Diagnostics;

namespace VP.cad
{
    public partial class EventoVersao : System.Web.UI.Page
    {

        protected void ImageButtonNovo2_Click(object sender, ImageClickEventArgs e)
        {
            DetailsViewEventoVersao.ChangeMode(DetailsViewMode.Insert);
            DetailsViewEventoVersao.DataBind();
            esconderDetailsViewEventoVersao(true);
/*            Label LabelDesEvento = DetailsViewEventoVersao.Rows[0].FindControl("LabelDesEvento") as Label;
            if (LabelDesEvento != null)
            {
                LabelDesEvento.Text = DropDownListEvento.SelectedItem.Text;
            }*/

        }

        protected void DetailsViewEventoVersao_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridViewEventoVersao.DataBind();
        }
        protected void DetailsViewEventoVersao_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridViewEventoVersao.DataBind();
        }
        protected void DetailsViewEventoVersao_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridViewEventoVersao.DataBind();
        }

        protected void GridViewEventoVersao_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            DetailsViewEventoVersao.DataBind();
        }
        protected void GridViewEventoVersao_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsViewEventoVersao.ChangeMode(DetailsViewMode.Edit);
            DetailsViewEventoVersao.DataBind();
            esconderDetailsViewEventoVersao(true);

            /*Label LabelEvento = DetailsViewEventoVersao.FindControl("LabelEvento") as Label;
            if (LabelEvento != null)
            {
                sCodEvento = LabelEvento.Text;
            } 
            Label LabelDesEvento = DetailsViewEventoVersao.FindControl("LabelDesEvento") as Label;
            if (LabelDesEvento != null)
            {
                sEvento = LabelDesEvento.Text;
            }*/
        }
        protected void esconderDetailsViewEventoVersao(bool esconder)
        {
            DetailsViewEventoVersao.Visible = esconder;
//            ImageButtonNovo2.Visible = esconder;
        }
        protected void GridViewEventoVersao_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DetailsViewEventoVersao.DataBind();
        }
        protected void GridViewEventoVersao_RowEditing(object sender, GridViewEditEventArgs e)
        {
            esconderDetailsViewEventoVersao(false);
        }
        protected void GridViewEventoVersao_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            esconderDetailsViewEventoVersao(true);
        }

        protected void DropDownListEvento_SelectedIndexChanged(object sender, EventArgs e)
        {
            esconderDetailsViewEventoVersao(false);
        }

        protected void DetailsViewEventoVersao_DataBound(object sender, EventArgs e)
        {
           // DetailsViewEventoVersao.Rows[1].Cells[1].Text = "1";

         
             
            /*if (DetailsViewEventoVersao.DataKey[1] != null)
            {
                TextBox1.Text = DetailsViewEventoVersao.DataKey[1].ToString();
            }*/

            /*if (DetailsViewEventoVersao.CurrentMode == DetailsViewMode.Insert) {
                Label LabelDesEvento = DetailsViewEventoVersao.FindControl("LabelEvento") as Label;

                LabelDesEvento.Text = DropDownListEvento.SelectedValue.ToString();
            }*/
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                /*DetailsViewEventoVersao.DefaultMode = DetailsViewMode.Insert;
                if (DetailsViewEventoVersao.FindControl("LabelEvento") != null)
                {
                    Label LabelDesEvento = (Label)DetailsViewEventoVersao.FindControl("LabelEvento");
                    LabelDesEvento.Text = DropDownListEvento.SelectedValue.ToString();
                }
                if (DetailsViewEventoVersao.CurrentMode == DetailsViewMode.Insert)
                {
                    Label LabelDesEvento = DetailsViewEventoVersao.Rows[0].FindControl("LabelDesEvento") as Label;
                    if (LabelDesEvento != null)
                    {
                        LabelDesEvento.Text = DropDownListEvento.SelectedItem.Text;
                    }
                }*/

                // esconderDetailsViewEventoVersao(GridViewEventoVersao.SelectedRow != null);
            }
        }

        protected void DetailsViewEventoVersao_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            try
            {
                SqlDataSourceEventoVersaoDV.InsertParameters["Evento"].DefaultValue = DropDownListEvento.SelectedValue.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

    }
    
}