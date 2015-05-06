using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VP.cad
{
    public partial class Usuario : System.Web.UI.Page
    {
        protected void ImageButtonNovo1_Click(object sender, ImageClickEventArgs e)
        {
            DetailsViewUsuario.ChangeMode(DetailsViewMode.Insert);
        }

        protected void ImageButtonNovo2_Click(object sender, ImageClickEventArgs e)
        {
            DetailsViewUsuario.ChangeMode(DetailsViewMode.Insert);
        }

        protected void DetailsViewUsuario_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridViewUsuario.DataBind();
        }
        protected void DetailsViewUsuario_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridViewUsuario.DataBind();
        }
        protected void DetailsViewUsuario_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridViewUsuario.DataBind();
        }

        protected void GridViewUsuario_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            DetailsViewUsuario.DataBind();
        }
        protected void GridViewUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsViewUsuario.ChangeMode(DetailsViewMode.Edit);
            DetailsViewUsuario.DataBind();
        }
        protected void esconderDetailsViewUsuario(bool esconder)
        {
            DetailsViewUsuario.Visible = esconder;
            ImageButtonNovo2.Visible = esconder;
        }
        protected void GridViewUsuario_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DetailsViewUsuario.DataBind();
        }
        protected void GridViewUsuario_RowEditing(object sender, GridViewEditEventArgs e)
        {
            esconderDetailsViewUsuario(false);
        }
        protected void GridViewUsuario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            esconderDetailsViewUsuario(true);
        }

        protected void DetailsViewUsuario_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {

        }

    }
}