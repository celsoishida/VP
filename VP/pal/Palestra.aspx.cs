using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VP.pal
{
    public partial class Palestra : System.Web.UI.Page
    {
  /*     protected void Page_Load(object sender, EventArgs e)
        {
            TextBox1.Text=Session["Evento"].ToString();
            TextBox2.Text=Session["EventoVersao"].ToString();
            Session.Remove("Evento");
            Session.Remove("EventoVersao");
        }
        */

        protected void ImageButtonNovo1_Click(object sender, ImageClickEventArgs e)
        {
            DetailsViewPalestra.ChangeMode(DetailsViewMode.Insert);
            DetailsViewPalestra.DataBind();
            mostrarDetailsViewPalestra(true);
        }

        protected void ImageButtonNovo2_Click(object sender, ImageClickEventArgs e)
        {
            DetailsViewPalestra.ChangeMode(DetailsViewMode.Insert);
            DetailsViewPalestra.DataBind();
            mostrarDetailsViewPalestra(true);
        }

        protected void GridViewPalestra_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            DetailsViewPalestra.DataBind();
        }
        protected void GridViewPalestra_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsViewPalestra.ChangeMode(DetailsViewMode.Edit);
            DetailsViewPalestra.DataBind();
            mostrarDetailsViewPalestra(true);
        }
        protected void GridViewPalestra_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DetailsViewPalestra.DataBind();
        }
        protected void GridViewPalestra_RowEditing(object sender, GridViewEditEventArgs e)
        {
            mostrarDetailsViewPalestra(false);
        }
        protected void GridViewPalestra_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            mostrarDetailsViewPalestra(true);
        }

        protected void DetailsViewPalestra_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridViewPalestra.DataBind();
        }
        protected void DetailsViewPalestra_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridViewPalestra.DataBind();
        }
        protected void DetailsViewPalestra_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridViewPalestra.DataBind();
        }
        protected void DetailsViewPalestra_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            try
            {
                SqlDataSourcePalestraDV.InsertParameters["Evento"].DefaultValue = DropDownListEvento.SelectedValue.ToString();
                SqlDataSourcePalestraDV.InsertParameters["EventoVersao"].DefaultValue = DropDownListEventoVersao.SelectedValue.ToString();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }
        protected void mostrarDetailsViewPalestra(bool mostrar)
        {
            DetailsViewPalestra.Visible = mostrar;
        }




    }
}