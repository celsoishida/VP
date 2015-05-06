using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VP.cad
{
    public partial class UF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButtonNovo1_Click(object sender, ImageClickEventArgs e)
        {
            DetailsViewEstado.ChangeMode(DetailsViewMode.Insert);
            DetailsViewEstado.DataBind();
            mostrarDetailsViewEstado(true);
        }

        protected void ImageButtonNovo2_Click(object sender, ImageClickEventArgs e)
        {
            DetailsViewEstado.ChangeMode(DetailsViewMode.Insert);
            DetailsViewEstado.DataBind();
            mostrarDetailsViewEstado(true);
        }

        protected void GridViewEstado_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            DetailsViewEstado.DataBind();
        }
        protected void GridViewEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsViewEstado.ChangeMode(DetailsViewMode.Edit);
            DetailsViewEstado.DataBind();
            mostrarDetailsViewEstado(true);
        }
        protected void GridViewEstado_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DetailsViewEstado.DataBind();
        }
        protected void GridViewEstado_RowEditing(object sender, GridViewEditEventArgs e)
        {
            mostrarDetailsViewEstado(false);
        }
        protected void GridViewEstado_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            mostrarDetailsViewEstado(true);
        }

        protected void DetailsViewEstado_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridViewEstado.DataBind();
        }
        protected void DetailsViewEstado_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridViewEstado.DataBind();
        }
        protected void DetailsViewEstado_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridViewEstado.DataBind();
        }
        protected void mostrarDetailsViewEstado(bool mostrar)
        {
            DetailsViewEstado.Visible = mostrar;
        }


    }
}