using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VP.cad
{
    public partial class TipoUsuario : System.Web.UI.Page
    {
        protected void ImageButtonNovo1_Click(object sender, ImageClickEventArgs e)
        {
            DetailsViewTipoUsuario.ChangeMode( DetailsViewMode.Insert);
        }

        protected void ImageButtonNovo2_Click(object sender, ImageClickEventArgs e)
        {
            DetailsViewTipoUsuario.ChangeMode( DetailsViewMode.Insert);
        }

        protected void DetailsViewTipoUsuario_ItemDeleted(object sender, DetailsViewDeletedEventArgs e)
        {
            GridViewTipoUsuario.DataBind();
        }
        protected void DetailsViewTipoUsuario_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridViewTipoUsuario.DataBind();
        }
        protected void DetailsViewTipoUsuario_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
            GridViewTipoUsuario.DataBind();
        }

        protected void GridViewTipoUsuario_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            DetailsViewTipoUsuario.DataBind();
        }
        protected void GridViewTipoUsuario_SelectedIndexChanged(object sender, EventArgs e)
        {
            DetailsViewTipoUsuario.ChangeMode(DetailsViewMode.Edit);
            DetailsViewTipoUsuario.DataBind();
        }
        protected void esconderDetailsViewTipoUsuario(bool esconder)
        {
            DetailsViewTipoUsuario.Visible = esconder;
            ImageButtonNovo2.Visible = esconder;
        }
        protected void GridViewTipoUsuario_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            DetailsViewTipoUsuario.DataBind();
        }
        protected void GridViewTipoUsuario_RowEditing(object sender, GridViewEditEventArgs e)
        {
            esconderDetailsViewTipoUsuario(false);
        }
        protected void GridViewTipoUsuario_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            esconderDetailsViewTipoUsuario(true);
        }

        protected void DetailsViewTipoUsuario_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {

        }


    }
}