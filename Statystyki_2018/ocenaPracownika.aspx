<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ocenaPracownika.aspx.cs" Inherits="Statystyki_2018.ocenaPracownika" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <script language=javascript>
        var xvalue
        var yvalue
        function printMousePos(event) {

            xvalue = event.pageX;
            yvalue = event.pageY;
        }

       document.addEventListener("click", printMousePos);


    function openPopup(strOpen)
        {
        open(strOpen, "Info", "status=1, width=300, height=200, top="+yvalue+", left="+xvalue);
    }

    function OnSelectedIndexChanged(s, e) {
        e.processOnServer = true;
    }
    </script>
     <link href="Styles/ssrocena.css" rel="stylesheet" />
   
    <style type="text/css">

 p.MsoNormal
	{margin-bottom:.0001pt;
	text-align:center;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	        margin-left: 0cm;
            margin-right: 0cm;
            margin-top: 0cm;
        }
      
        
      
        </style>
   
    
   
    

    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>


   <div class="noprint" >
      <div  class="manu_back" style="height :50px">

          

    </div>
      </div>
 
   
    
   <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:-45px" >
    <div class="noprint" >
     
          
   <table >
        <tr>
           
              
               <td style="width:80px">
                  
                <asp:Label ID="Label4" runat="server" Text="Zakres dat:"></asp:Label>
                  
               </td>
               <td class="sto ">
                  
                   <dx:ASPxDateEdit ID="data1" runat="server" Theme="Moderno">
                   </dx:ASPxDateEdit>
                  
            </td>
            <td style ="width:5px"></td>
            <td class="sto " >
                   <dx:ASPxDateEdit ID="data2" runat="server" Theme="Moderno">
                   </dx:ASPxDateEdit>
               </td>
            <td style="width:80px;" align="right" >
              
                   Wydział: 
              
               </td>
            <td style="width:5px;"></td>
             <td class="sto " >
                   
                 <dx:ASPxComboBox ID="ASPxComboBox1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ASPxComboBox1_SelectedIndexChanged" ValueType="System.String" Theme="Moderno">
                 </dx:ASPxComboBox>
                   
             </td>
              <td style="width:100px" align="right"  >
               
                  Pracownik:</td>
            <td style="width:5px"></td>
              <td class="sto " >
               
                  <dx:ASPxComboBox ID="ASPxComboBox2" runat="server" ValueType="System.String" Theme="Moderno">
                  </dx:ASPxComboBox>
               </td>
            <td style="width:5px;"></td>
             <td class="blackBox sto" align ="right">

                <asp:LinkButton ID="LinkButton54" runat="server" class="btn_search" OnClick="LinkButton54_Click" > Odśwież</asp:LinkButton>
            </td>
           <td style="width:20px;">

           </td>
    
             <td class="blackBox sto" align="right" >

                <asp:LinkButton ID="LinkButton55" runat="server" class="btn_search" OnClick="drucz" > Drukuj</asp:LinkButton>
          
                </td>   </tr>
    </table>
  
       
        <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" Theme="Moderno" Width="100%">
            <SettingsPager PageSize="50">
            </SettingsPager>
<SettingsCommandButton>
<ShowAdaptiveDetailButton ButtonType="Image"></ShowAdaptiveDetailButton>

<HideAdaptiveDetailButton ButtonType="Image"></HideAdaptiveDetailButton>
</SettingsCommandButton>
            <SettingsText EmptyDataRow="Brak danych" />
            <Styles>
                <AlternatingRow BackColor="#C0CDD8">
                </AlternatingRow>
            </Styles>
        </dx:ASPxGridView>
        <br />
        <asp:Label ID="Label5" runat="server"></asp:Label>
        <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1">
        </dx:ASPxGridViewExporter>
        <br />
   
  
       
      
  
       
       <br />
      
  
       
  </div>

   
    </div>
</asp:Content>

