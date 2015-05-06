using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Diagnostics;

/// <summary>
/// Summary description for CYI
/// </summary>
public class CYI
{
	public CYI()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string connectionString = "Data Source=.;Initial Catalog=emprego;User Id=vpexe;Password=gpcit2015;";
    
    public static String ConsultaDescricao ( String Codigo, String Tabela, out String Descricao) {

        String MensagemErro="", sDesTemp="";
        if (Codigo  != "")
        {
            StringBuilder errorMessages = new StringBuilder();

            SqlCommand sqlComando;
            SqlConnection sqlConexao = new SqlConnection(connectionString);

            sqlComando = new SqlCommand();
            sqlConexao.Open();
            sqlComando.Connection = sqlConexao;
            //Here I am definied command type is Stored Procedure.
            sqlComando.CommandType = CommandType.Text;

            // Stored Procedure name
            sqlComando.CommandText = @"select Descricao from " + Tabela + @" where codigo = " + Codigo;

            try
            {
                SqlDataReader sdr = sqlComando.ExecuteReader();

                //            do {
                while (sdr.Read())
                {
                    sDesTemp= sdr["Descricao"].ToString();
                }
                //            } while ( sdr.NextResult());

            }
            catch (SqlException ex)
            {
                for (int i = 0; i < ex.Errors.Count; i++)
                {
                    errorMessages.Append("Index #" + i + "\n" +
                        "Message: " + ex.Errors[i].Message + "\n" +
                        "LineNumber: " + ex.Errors[i].LineNumber + "\n" +
                        "Source: " + ex.Errors[i].Source + "\n" +
                        "Procedure: " + ex.Errors[i].Procedure + "\n");
                }
                Console.WriteLine(errorMessages.ToString());
                Debug.WriteLine(errorMessages.ToString());
                MensagemErro = errorMessages.ToString();

            }
            catch (Exception e2)
            {
                Console.WriteLine("{0} Exception caught.", e2);
                Debug.WriteLine("{0} Exception caught.", e2);

                MensagemErro = e2.ToString();
            }

            sqlComando.Dispose();
            sqlConexao.Close();

        } 
        Descricao = sDesTemp;
        return MensagemErro;
    }

    public static String ConsultaDescricao(String Codigo, String Tabela, String DescricaoDes, out String Descricao)
    {

        String MensagemErro = "", sDesTemp = "";
        if (Codigo != "")
        {
            StringBuilder errorMessages = new StringBuilder();

            SqlCommand sqlComando;
            string connectionString = "Data Source=.;Initial Catalog=livro;User Id=livroexe;Password=livro2012;";
            SqlConnection sqlConexao = new SqlConnection(connectionString);

            sqlComando = new SqlCommand();
            sqlConexao.Open();
            sqlComando.Connection = sqlConexao;
            //Here I am definied command type is Stored Procedure.
            sqlComando.CommandType = CommandType.Text;

            // Stored Procedure name
            sqlComando.CommandText = @"select " + DescricaoDes + " from " + Tabela + @" where codigo = " + Codigo;

            try
            {
                SqlDataReader sdr = sqlComando.ExecuteReader();

                //            do {
                while (sdr.Read())
                {
                    sDesTemp = sdr[DescricaoDes].ToString();
                }
                //            } while ( sdr.NextResult());

            }
            catch (SqlException ex)
            {
                for (int i = 0; i < ex.Errors.Count; i++)
                {
                    errorMessages.Append("Index #" + i + "\n" +
                        "Message: " + ex.Errors[i].Message + "\n" +
                        "LineNumber: " + ex.Errors[i].LineNumber + "\n" +
                        "Source: " + ex.Errors[i].Source + "\n" +
                        "Procedure: " + ex.Errors[i].Procedure + "\n");
                }
                Console.WriteLine(errorMessages.ToString());
                Debug.WriteLine(errorMessages.ToString());
                MensagemErro = errorMessages.ToString();

            }
            catch (Exception e2)
            {
                Console.WriteLine("{0} Exception caught.", e2);
                Debug.WriteLine("{0} Exception caught.", e2);

                MensagemErro = e2.ToString();
            }

            sqlComando.Dispose();
            sqlConexao.Close();

        }
        Descricao = sDesTemp;
        return MensagemErro;
    }

}
