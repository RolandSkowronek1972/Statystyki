<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="2ocenasedziego.aspx.cs" Inherits="stat2018.2ocenasedziego" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>



<%@ Register src="UserControlls/PopupLinkButtom.ascx" tagname="PopupLinkButtom" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
    
   
    <style type="text/css">
        .auto-style2 {
            width: 165px;
            height: 35px;
        }
        .auto-style3 {
            height: 35px;
        }
        .auto-style4 {
            height: 17px;
        }
    </style>
   

    <link href="Styles/ssrocena.css" rel="stylesheet" />

    <div class="dataBar"> 
 <ajaxToolkit:ToolkitScriptManager runat="Server" EnableScriptGlobalization="true"
        EnableScriptLocalization="true" ID="ScriptManager1" />
    <div class="noprint" >
      <div  class="manu_back">
                  
   <table class="tbl_manu" style="top: -5px">
        <tr>
            <td class="2sto">
                <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
                <asp:textbox runat="server" ID="Date1"  ReadOnly="False" EnableViewState="False" ViewStateMode="Enabled" Width="75px"></asp:textbox>     
                <ajaxToolkit:CalendarExtender ID="Date1_CalendarExtender" runat="server" 
                    Enabled="True" TargetControlID="Date1" ViewStateMode="Enabled">
                </ajaxToolkit:CalendarExtender>

                      <asp:TextBox runat="server" ID="Date2" ReadOnly="False" EnableViewState="False" Width="75px" />
                      
        <ajaxToolkit:CalendarExtender ID="Date2ButtonExtender" runat="server" TargetControlID="Date2"   Enabled="True" ViewStateMode="Enabled"      />

            </td>
               <td >
                   &nbsp;</td>
               <td >
                   &nbsp;</td>
               <td >
                   Sędzia:</td>
            <td class="sto " >
                   <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
            </td>
             <td class="blackBox sto">
                <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click"> Odśwież</asp:LinkButton>
            </td>
            <td class="sto " >
                
                &nbsp;</td>
           <td class="sto " >
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    
    </table>
    </div>
      </div>
    </div>   
   <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:60px;" class="content">
     <div id="Div2"  style="z-index:10; "> 
        <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
            <asp:Label ID="Label3" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
     <br />
         </div> 
         <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
             <asp:label runat="server" ID="id_dzialu" Visible="False"></asp:label></div> 
  

         <br />
  

         <asp:Label ID="Label5" runat="server" ForeColor="Red"></asp:Label>
         <ajaxToolkit:TabContainer ID="TabContainer2" runat="server" ActiveTabIndex="0" Width="100%" >
              <ajaxToolkit:TabPanel runat="server" HeaderText="SR(1)" ID="TabPanel1">
                 <ContentTemplate>
                     
                      <br />
                      <table style="border: 1px solid #000000; width: 700px" cellpadding="0" cellspacing="0">
             <tr>
                 <td rowspan="3" class="blackBox" style="border: 1px solid #000000">
                     <asp:Label ID="Label36" runat="server" Text="SSR ....."></asp:Label>
                 </td>
                 <td colspan="5" class="blackBox">
                     <asp:Label ID="Label37" runat="server" Text="Ulopy i zwolnienia"></asp:Label>
                 </td>
             </tr>
             <tr>
                 <td class="blackBox sto">
                     <asp:Label ID="dateLabel1" runat="server" Text="Label"></asp:Label>
                   </td>
                   <td class="blackBox sto">
                   <asp:Label ID="dateLabel2" runat="server" Text="Label"></asp:Label>
                   </td>
                 <td class="blackBox sto">
                    <asp:Label ID="dateLabel3" runat="server" Text="Label"></asp:Label></td>
                 <td class="blackBox sto">
                     <asp:Label ID="dateLabel4" runat="server" Text="Label"></asp:Label>
                   </td>
                 <td class="blackBox sto">
                     <asp:Label ID="Label42" runat="server" Text="Razem"></asp:Label>
                   </td>
             </tr>
             <tr>
                  <td class="blackBox sto">     <asp:Label ID="z1s1w1k1" runat="server" Text="0"></asp:Label></td>
                  <td class="blackBox sto">     <asp:Label ID="z1s1w1k2" runat="server" Text="0"></asp:Label></td>
                  <td class="blackBox sto">     <asp:Label ID="z1s1w1k3" runat="server" Text="0"></asp:Label></td>
                  <td class="blackBox sto">     <asp:Label ID="z1s1w1k4" runat="server" Text="0"></asp:Label></td>
                  <td class="blackBox sto">     <asp:Label ID="z1s1w1k5" runat="server" Text="0"></asp:Label></td>
             </tr>
         </table>
 
                       <br />
                  
                       <table style="border: 1px solid #000000; width: 700px;" cellpadding="0" cellspacing="0" >
                         <tr>
                              <td colspan="2" rowspan="2" style="border-style: solid; border-width: 1px; border-color: #eee">&nbsp;</td>
                             <td colspan="5" align="center" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="Label43" runat="server" Text="SRR ... w ujęciu liczbowym"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="dateLabel11" runat="server" Text="Label"></asp:Label>
                             </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="dateLabel12" runat="server" Text="Label"></asp:Label>
                             </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="dateLabel13" runat="server" Text="Label"></asp:Label>
                             </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="dateLabel14" runat="server" Text="Label"></asp:Label>
                             </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="Label48" runat="server" Text="Razem"></asp:Label>
                                  </strong>
                             </td>
                         </tr>
                         <tr>
                              <td rowspan="3" align="center" style="border: 1px solid #EEEEEE; width: 100px">
                                  <div class="rotateText">
                                  <asp:Label ID="Label143" runat="server" Text="Liczba odbytych sesji / posiedzeń" CssClass="rotateText"></asp:Label>
                                      </div>
                              </td>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label49" runat="server" Text="Rozprawy"></asp:Label>
                             </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s2w1k1" runat="server" Text="0"></asp:Label>
                             </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s2w1k2" runat="server" Text="0"></asp:Label>
                             </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s2w1k3" runat="server" Text="0"></asp:Label>
                             </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s2w1k4" runat="server" Text="0"></asp:Label>
                             </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s2w1k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                             </td>
                         </tr>
                           <tr>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label55" runat="server" Text="Posiedzenia"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s2w2k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s2w2k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s2w2k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s2w2k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s2w2k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                           <tr>
                              <td class="blackBox sto">
                                  <strong>
                                  <asp:Label ID="Label61" runat="server" Text="Razem"></asp:Label>
                                  </strong>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s2w3k1" runat="server" Font-Bold="True" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s2w3k2" runat="server" Font-Bold="True" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s2w3k3" runat="server" Font-Bold="True" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s2w3k4" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s2w3k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                           <tr>
                              <td  style="border: 1px solid #EEEEEE; width: 100px;" rowspan="7">
                                    <div class="rotateText">
                                  <asp:Label ID="Label145" runat="server" Text="Liczba i rodzaj spraw wyznaczonych"></asp:Label>
                                        </div> 
                               </td>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label67" runat="server" Text="GC"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w1k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w1k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w1k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w1k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s3w1k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                           <tr>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label18" runat="server" Text="GNs"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w2k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w2k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w2k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w2k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s3w2k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                          <tr>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label25" runat="server" Text="GNc"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w3k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w3k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w3k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w3k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s3w3k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                          <tr>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label77" runat="server" Text="GCo"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w4k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w4k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w4k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w4k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s3w4k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                          <tr>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label83" runat="server" Text="GCps"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w5k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w5k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w5k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w5k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <asp:Label ID="z1s3w5k5" runat="server" Text="0"></asp:Label>
                               </td>
                         </tr>
                          <tr>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label89" runat="server" Text="WSC"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w6k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w6k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w6k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s3w6k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s3w6k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                          <tr>
                              <td class="blackBox sto">
                                  <strong>
                                  <asp:Label ID="Label95" runat="server" Text="Razem"></asp:Label>
                                  </strong>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s3w7k1" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s3w7k2" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s3w7k3" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s3w7k4" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s3w7k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                            <tr>
                              <td  rowspan="7" align="center" style="border: 1px solid #EEEEEE; width: 100px">
                                    <div class="rotateText">
                                  <asp:Label ID="Label146" runat="server" Text="Liczba i rodzaj spraw załatwionych"></asp:Label>
                                        </div>
                                </td>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label101" runat="server" Text="GC"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w1k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w1k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w1k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w1k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s4w1k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                           <tr>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label107" runat="server" Text="GNs"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w2k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w2k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w2k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w2k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s4w2k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                          <tr>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label113" runat="server" Text="GNc"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w3k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w3k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w3k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w3k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s4w3k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                          <tr>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label119" runat="server" Text="GCo"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w4k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w4k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w4k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w4k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s4w4k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                          <tr>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label125" runat="server" Text="GCps"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w5k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w5k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w5k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w5k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s4w5k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                          <tr>
                              <td class="blackBox sto">
                                 <asp:Label ID="Label131" runat="server" Text="WSC"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w6k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w6k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w6k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                 <asp:Label ID="z1s4w6k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s4w6k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                          <tr>
                              <td class="blackBox sto">
                                  <strong>
                                  <asp:Label ID="Label137" runat="server" Text="Razem"></asp:Label>
                                  </strong>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s4w7k1" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s4w7k2" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s4w7k3" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s4w7k4" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <strong>
                                  <asp:Label ID="z1s4w7k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                               </td>
                         </tr>
                           <tr>
                              <td colspan="2">
                                  <asp:Label ID="Label144" runat="server" Text="Liczba spraw odroczonych"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <asp:Label ID="z1s5w1k1" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <asp:Label ID="z1s5w1k2" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <asp:Label ID="z1s5w1k3" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <asp:Label ID="z1s5w1k4" runat="server" Text="0"></asp:Label>
                               </td>
                              <td class="blackBox sto" style="border-style: solid; border-width: 1px; border-color: #eee">
                                  <asp:Label ID="z1s5w1k5" runat="server" Text="0"></asp:Label>
                               </td>

                         </tr>
                     </table>

                 </ContentTemplate>
         
             </ajaxToolkit:TabPanel>
              <ajaxToolkit:TabPanel runat="server" HeaderText="SR(2)" ID="TabPanel2">
                    <ContentTemplate>
                        <asp:Label ID="Label1" runat="server" Text="Terminowość sporządzania uzasadnień (od 1 stycznia 2013 do 31 marca 2016 r.) - SSR..." Font-Bold="True"></asp:Label>
                        
                        <table style="width:100%;" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="border-style: solid; border-width: 1px; border-color: #eee;">&nbsp;</td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px;">
                                    <strong>
                                    <asp:Label ID="Label154" runat="server" Text="Razem sporządzonych uzasadnień"></asp:Label>
                                    </strong>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px;">
                                    <asp:Label ID="Label155" runat="server" Text="w tym w sprawach w których nie wniesiono środka zaskarżenia"></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px;">
                                    <asp:Label ID="Label156" runat="server" Text="w terminie"></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px;">
                                    <asp:Label ID="Label157" runat="server" Text="po terminie do 1 mies."></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px;">
                                    <asp:Label ID="Label158" runat="server" Text="(w tym nieusprawiedliwione)"></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px;">
                                    <asp:Label ID="Label159" runat="server" Text="po terminie 1 do 3 mies."></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px;">
                                    <asp:Label ID="Label160" runat="server" Text="(w tym nieusprawiedliwione)"></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px;">
                                    <asp:Label ID="Label161" runat="server" Text="po terminie pow. 3 mies."></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px;">
                                    <asp:Label ID="Label162" runat="server" Text="( w tym nieusprawiedliwione)"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="border-style: solid; border-width: 1px; border-color: #eee; height: 35px"><strong>
                                    <asp:Label ID="Label152" runat="server" Text="GC"></asp:Label>
                                    </strong></td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w1k1" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w1k2" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w1k3" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w1k4" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w1k5" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w1k6" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w1k7" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w1k8" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w1k9" runat="server" Text="0"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style2" style="border-style: solid; border-width: 1px; border-color: #eee; height: 35px"><strong>
                                    <asp:Label ID="Label153" runat="server" Text="GNs"></asp:Label>
                                    </strong></td>
                                <td align="center" class="auto-style3" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w2k1" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" class="auto-style3" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w2k2" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" class="auto-style3" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w2k3" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" class="auto-style3" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w2k4" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" class="auto-style3" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w2k5" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" class="auto-style3" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w2k6" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" class="auto-style3" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w2k7" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" class="auto-style3" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w2k8" runat="server" Text="0"></asp:Label>
                                </td>
                                <td align="center" class="auto-style3" style="border-style: solid; border-width: 1px; border-color: #eee; width: 120px; height: 35px;">
                                    <asp:Label ID="z2s1w2k9" runat="server" Text="0"></asp:Label>
                                </td>
                            </tr>
                        </table>

                     
                        </ContentTemplate>
             </ajaxToolkit:TabPanel>
              
             <ajaxToolkit:TabPanel ID="TabPanel3" runat="server" HeaderText="SR(3)">
                 <ContentTemplate>
                     <strong>
                     <asp:Label ID="Label164" runat="server" Text="Liczba spraw w referacie (na ostatni dzień okresu statystycznego) - SSR... w Sądzie Rejonowym"></asp:Label>
                     </strong>
                     <br />
                     <table style="width:100%;" cellpadding="0" cellspacing="0">
                         <tr>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="Label165" runat="server" Text="Rep."></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="Label166" runat="server" Text="wg danych na dzień:"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="Label167" runat="server" Text="Razem"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="Label168" runat="server" Text="do 3 mies."></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="Label169" runat="server" Text="3 - 6 mies."></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="Label170" runat="server" Text="6 - 12 mies"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="Label171" runat="server" Text="12-36 mies."></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="Label172" runat="server" Text="powyżej 36 mies."></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td align="center" rowspan="4" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;"><strong>
                                 <asp:Label ID="Label316" runat="server" Text="GC"></asp:Label>
                                 </strong></td>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT11" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w1k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w1k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w1k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w1k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w1k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w1k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT12" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w2k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w2k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w2k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w2k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w2k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w2k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT13" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w3k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w3k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w3k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w3k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w3k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w3k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT14" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w4k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w4k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w4k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w4k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w4k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s1w4k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="center" rowspan="4" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;"><strong>
                                 <asp:Label ID="Label317" runat="server" Text="GNs"></asp:Label>
                                 </strong></td>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT21" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w1k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w1k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w1k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w1k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w1k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w1k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT22" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w2k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w2k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w2k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w2k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w2k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w2k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT23" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w3k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w3k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w3k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w3k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w3k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w3k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT24" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w4k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w4k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w4k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w4k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w4k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s2w4k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="center" rowspan="4" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;"><strong>
                                 <asp:Label ID="Label318" runat="server" Text="GNc"></asp:Label>
                                 </strong></td>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT31" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w1k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w1k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w1k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w1k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w1k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w1k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT32" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w2k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w2k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w2k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w2k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w2k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w2k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT33" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w3k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w3k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w3k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w3k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w3k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w3k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT34" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w4k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w4k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w4k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w4k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w4k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s3w4k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="center" rowspan="4" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;"><strong>
                                 <asp:Label ID="Label319" runat="server" Text="GCo"></asp:Label>
                                 </strong></td>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT41" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w1k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w1k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w1k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w1k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w1k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w1k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT42" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w2k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w2k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w2k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w2k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w2k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w2k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT43" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w3k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w3k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w3k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w3k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w3k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w3k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT44" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w4k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w4k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w4k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w4k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w4k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s4w4k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="center" rowspan="4" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;"><strong>
                                 <asp:Label ID="Label320" runat="server" Text="GCps"></asp:Label>
                                 </strong></td>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT51" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w1k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w1k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w1k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w1k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w1k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w1k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT52" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w2k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w2k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w2k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w2k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w2k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w2k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT53" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w3k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w3k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w3k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w3k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w3k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w3k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT54" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w4k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w4k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w4k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w4k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w4k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s5w4k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="center" rowspan="4" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;"><strong>
                                 <asp:Label ID="Label321" runat="server" Text="WSC"></asp:Label>
                                 </strong></td>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT61" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w1k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w1k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w1k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w1k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w1k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w1k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT62" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w2k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w2k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w2k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w2k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w2k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w2k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT63" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w3k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w3k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w3k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w3k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w3k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w3k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                            <tr>
                             <td align="left" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="dT64" runat="server" Text="Label"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w4k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w4k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w4k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w4k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w4k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td align="center" style="border-style: solid; border-width: 1px; border-color: #eee; width: 104px; height: 35px;">
                                 <asp:Label ID="z3s6w4k6" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>

                     </table>
                 </ContentTemplate>
             </ajaxToolkit:TabPanel>

                   <ajaxToolkit:TabPanel ID="TabPanel4" runat="server" HeaderText="SR(4)">
                  <ContentTemplate>
                      <strong>
                      <asp:Label ID="Label323" runat="server" Text="Wynik postępowania apelacyjnego "></asp:Label>
                      </strong>
                      <asp:Label ID="dataLabelSR4" runat="server" Text="(od 1 stycznia 2013 do 31 marca 2016 r.)"></asp:Label>
                      <br />
                      <table cellpadding="0" cellspacing="0">
                          <tr>
                              <td class="wideBox">
                                  &nbsp;</td>
                              <td class="middleBox">
                                  <asp:Label ID="Label325" runat="server" Text="SSR....."></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="Label326" runat="server" Text="%"></asp:Label>
                              </td>
                                 <td class="middleBox">
                                     <asp:Label ID="Label327" runat="server" Text="Razem w wydziale"></asp:Label>
                              </td>
                                 <td class="smallBox">
                                     <asp:Label ID="Label328" runat="server" Text="%"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBox">
                                  <strong>
                                  <asp:Label ID="Label6" runat="server" Text="Wniesiono"></asp:Label>
                                  </strong>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s1w1k9" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="smallBox">
                                     <asp:Label ID="z4s1w1k10" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s1w1k11" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s1w1k12" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                       
                             <tr>
                              <td class="wideBox">
                                  <strong>
                                  <asp:Label ID="Label183" runat="server" Text="Rozpoznano"></asp:Label>
                                  </strong>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s1w1k5" runat="server" Text="0"></asp:Label>
                                 </td>
                                 <td class="smallBox">
                                     <asp:Label ID="z4s1w1k6" runat="server" Text="0"></asp:Label>
                                 </td>
                                 <td class="middleBox">
                                     <asp:Label ID="z4s1w1k7" runat="server" Text="0"></asp:Label>
                                 </td>
                                 <td class="smallBox">
                                     <asp:Label ID="z4s1w1k8" runat="server" Text="0"></asp:Label>
                                 </td>
                          </tr>
                          <tr>
                              <td class="wideBox">
                                  <asp:Label ID="Label218" runat="server" Text="Utrzymano / Oddalono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s1w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s1w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s1w1k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s1w1k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBox">
                                  <asp:Label ID="Label253" runat="server" Text="Uchylono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s1w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s1w2k2" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="middleBox">
                                     <asp:Label ID="z4s1w2k3" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="smallBox">
                                     <asp:Label ID="z4s1w2k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBox">
                                  <asp:Label ID="Label288" runat="server" Text="Zmieniono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s1w3k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s1w3k2" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="middleBox">
                                     <asp:Label ID="z4s1w3k3" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="smallBox">
                                     <asp:Label ID="z4s1w3k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBox">
                                  <asp:Label ID="Label330" runat="server" Text="Załatwiono w inny sposób"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s1w4k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s1w4k2" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="middleBox">
                                     <asp:Label ID="z4s1w4k3" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="smallBox">
                                     <asp:Label ID="z4s1w4k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>

                          <tr>
                              
                              <td  colspan="5">
                                  &nbsp;</td>
                                
                          </tr>
                       
                             <tr>
                                 <td  colspan="5" ><strong>
                                     <asp:Label ID="Label445" runat="server" Text="Wynik postępowania zażaleniowego"></asp:Label>
                                     &nbsp;</strong><asp:Label ID="dataLabelSR5" runat="server" Text="(od 1 stycznia 2013 do 31 marca 2016 r.)"></asp:Label>
                                 </td>
                          </tr>
                             <tr>
                              <td  class="wideBox">
                                  &nbsp;</td>
                              <td class="middleBox">
                                  <asp:Label ID="Label364" runat="server" Text="SSR....."></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="Label365" runat="server" Text="%"></asp:Label>
                              </td>
                                 <td class="middleBox">
                                     <asp:Label ID="Label366" runat="server" Text="Razem w wydziale"></asp:Label>
                              </td>
                                 <td class="smallBox">
                                     <asp:Label ID="Label367" runat="server" Text="%"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td  class="wideBox">
                                  <strong>
                                  <asp:Label ID="Label190" runat="server" Text="Wniesiono"></asp:Label>
                                  </strong>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s2w1k5" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s2w1k7" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="middleBox">
                                     <asp:Label ID="z4s2w1k9" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="smallBox">
                                     <asp:Label ID="z4s2w1k11" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBox"><strong>
                                  <asp:Label ID="Label197" runat="server" Text="Rozpoznano"></asp:Label>
                                  </strong></td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s2w1k6" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s2w1k8" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s2w1k10" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s2w1k12" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBox">
                                  <asp:Label ID="Label204" runat="server" Text="Utrzymano / Oddalono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s2w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s2w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s2w1k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s2w1k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td  class="wideBox">
                                  <asp:Label ID="Label337" runat="server" Text="Uchylono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s2w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s2w2k2" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="middleBox">
                                     <asp:Label ID="z4s2w2k3" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="smallBox">
                                     <asp:Label ID="z4s2w2k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td  class="wideBox">
                                  <asp:Label ID="Label343" runat="server" Text="Zmieniono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s2w3k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s2w3k2" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="middleBox">
                                     <asp:Label ID="z4s2w3k3" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="smallBox">
                                     <asp:Label ID="z4s2w3k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td  class="wideBox">
                                  <asp:Label ID="Label352" runat="server" Text="Załatwiono w inny sposób"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z4s2w4k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z4s2w4k2" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="middleBox">
                                     <asp:Label ID="z4s2w4k3" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="smallBox">
                                     <asp:Label ID="z4s2w4k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>

                          <tr>
                              <td colspan="5">
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td   colspan="5">
                                  <asp:Label ID="Label340" runat="server" Text="Wskaźnik zaskarżalności" Font-Bold="True"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td  class="wideBox">
                                  &nbsp;</td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="Label346" runat="server" Text="SSR..."></asp:Label>
                              </td>
                                 <td class="wideBox" colspan="2">
                                     <asp:Label ID="Label348" runat="server" Text="Razem w Wydziale"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td  class="wideBox">
                                  <asp:Label ID="Label350" runat="server" Text="liczba spraw załatwionych podlegających zaskarżeniu"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z4s3w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="wideBox" colspan="2">
                                     <asp:Label ID="z4s3w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td  class="wideBox">
                                  <asp:Label ID="Label355" runat="server" Text="liczba wniesionych apelacji"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z4s3w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="wideBox" colspan="2">
                                     <asp:Label ID="z4s3w2k2" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td  class="wideBox">
                                  <asp:Label ID="Label360" runat="server" Text="wskaźnik zaskarżalności"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z4s3w3k1" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="wideBox" colspan="2">
                                     <asp:Label ID="z4s3w3k2" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td   colspan="5">
                                  &nbsp;</td>
                          </tr>
                          <tr>
                              <td   colspan="5">
                                  <asp:Label ID="Label370" runat="server" Text="Wskaźnik stabilności" Font-Bold="True"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td  class="wideBox">
                                  &nbsp;</td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="Label376" runat="server" Text="SSR..."></asp:Label>
                              </td>
                                 <td class="wideBox" colspan="2">
                                     <asp:Label ID="Label378" runat="server" Text="Razem w wydziale"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td  class="wideBox">
                                  <asp:Label ID="Label380" runat="server" Text="liczba spraw załatwionych podlegających zaskarżeniu"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z4s4w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="wideBox" colspan="2">
                                     <asp:Label ID="z4s4w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td  class="wideBox">
                                  <asp:Label ID="Label385" runat="server" Text="liczba spraw, w których orzeczenia zostały zmienione lub uchylone"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z4s4w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="wideBox" colspan="2">
                                     <asp:Label ID="z4s4w2k2" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td  class="wideBox">
                                  <asp:Label ID="Label390" runat="server" Text="wskaźnik stabilności"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z4s4w3k1" runat="server" Text="0"></asp:Label>
                              </td>
                                 <td class="wideBox" colspan="2">
                                     <asp:Label ID="z4s4w3k2" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                        
                      </table>
                      </ContentTemplate>
             </ajaxToolkit:TabPanel>

              <ajaxToolkit:TabPanel ID="TabPanel5" runat="server" HeaderText="SO(1)">
                  <ContentTemplate>
                      <asp:Label ID="Label19" runat="server" Text="Label"></asp:Label>
                      <table style="width: 100%;" class="tabless01" cellpadding="0" cellspacing="0">
                          <tr>
                              <td colspan="2">&nbsp;</td>
                              <td>
                                  <asp:Label ID="dataLabelSO11" runat="server" Text="Label"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="dataLabelSO12" runat="server" Text="Label"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="dataLabelSO13" runat="server" Text="Label"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="dataLabelSO14" runat="server" Text="Label"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="dataLabelSO15" runat="server" Text="Razem"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td rowspan="3" style="width: 165px">
                                  <asp:Label ID="Label515" runat="server" Text="Liczba odbytych sesji / posiedzeń"></asp:Label>
                              </td>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label451" runat="server" Text="Rozprawy"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s1w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s1w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s1w1k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s1w1k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s1w1k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>

                              <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label33" runat="server" Text="Posiedzenia"></asp:Label>
                              </td>
                              <td  >
                                  <asp:Label ID="z5s1w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s1w2k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s1w2k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s1w2k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s1w2k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <strong>
                                  <asp:Label ID="Label371" runat="server" Text="Razem"></asp:Label>
                                  </strong>
                              </td>
                              <td abbr="0" align="0">
                                  <strong>
                                  <asp:Label ID="z5s1w3k1" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s1w3k2" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s1w3k3" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s1w3k4" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s1w3k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td rowspan="9" style="width: 165px">
                                  <asp:Label ID="Label516" runat="server" Text="Liczba i rodzaj spraw wyznaczonych"></asp:Label>
                              </td>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label379" runat="server" Text="GC"></asp:Label>
                              </td>
                              <td  >
                                  <asp:Label ID="z5s2w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w1k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w1k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s2w1k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label394" runat="server" Text="GNs"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s2w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w2k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w2k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w2k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s2w2k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td align="left" class="auto-style2">
                                  <asp:Label ID="Label400" runat="server" Text="GCo"></asp:Label>
                              </td>
                              <td abbr="0" align="0" class="auto-style3">
                                  <asp:Label ID="z5s2w3k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="auto-style3">
                                  <asp:Label ID="z5s2w3k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="auto-style3">
                                  <asp:Label ID="z5s2w3k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="auto-style3">
                                  <asp:Label ID="z5s2w3k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="auto-style3">
                                  <strong>
                                  <asp:Label ID="z5s2w3k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label406" runat="server" Text="GNc"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s2w4k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w4k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w4k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w4k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s2w4k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label412" runat="server" Text="Ga"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s2w5k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w5k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w5k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w5k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s2w5k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label418" runat="server" Text="Gz"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s2w6k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w6k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w6k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w6k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s2w6k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label424" runat="server" Text="WSC"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s2w7k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w7k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w7k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w7k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s2w7k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label430" runat="server" Text="S"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s2w8k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w8k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w8k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s2w8k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s2w8k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <strong>
                                  <asp:Label ID="Label436" runat="server" Text="Razem"></asp:Label>
                                  </strong>
                              </td>
                              <td abbr="0" align="0">
                                  <strong>
                                  <asp:Label ID="z5s2w9k1" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s2w9k2" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s2w9k3" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s2w9k4" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s2w9k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td rowspan="9" style="width: 165px">
                                  <asp:Label ID="Label526" runat="server" Text="Liczba i rodzaj spraw załatwionych"></asp:Label>
                              </td>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label517" runat="server" Text="GC"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s3w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w1k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w1k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s3w1k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label518" runat="server" Text="GNs"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s3w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w2k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w2k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w2k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w2k5" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label519" runat="server" Text="GCo"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s3w3k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w3k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w3k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w3k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w3k5" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label520" runat="server" Text="GNc"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s3w4k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w4k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w4k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w4k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w4k5" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label521" runat="server" Text="Ga"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s3w5k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w5k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w5k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w5k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w5k5" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label522" runat="server" Text="Gz"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s3w6k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w6k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w6k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w6k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w6k5" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label523" runat="server" Text="WSC"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s3w7k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w7k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w7k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w7k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w7k5" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <asp:Label ID="Label524" runat="server" Text="S"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s3w8k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w8k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w8k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w8k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s3w8k5" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
    <tr>
                              <td align="left" style="width: 165px">
                                  <strong>
                                  <asp:Label ID="Label525" runat="server" Text="Razem"></asp:Label>
                                  </strong>
                              </td>
                              <td abbr="0" align="0">
                                  <strong>
                                  <asp:Label ID="z5s3w9k1" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s3w9k2" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s3w9k3" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s3w9k4" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                              <td>
                                  <strong>
                                  <asp:Label ID="z5s3w9k5" runat="server" Text="0"></asp:Label>
                                  </strong>
                              </td>
                          </tr>
    <tr>
                              <td colspan="2">
                                  <asp:Label ID="Label503" runat="server" Text="Liczba spraw odroczonych"></asp:Label>
                              </td>
                              <td abbr="0" align="0">
                                  <asp:Label ID="z5s4w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s4w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s4w1k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s4w1k4" runat="server" Text="0"></asp:Label>
                              </td>
                              <td>
                                  <asp:Label ID="z5s4w1k5" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>

                      </table>
                  </ContentTemplate>
              </ajaxToolkit:TabPanel>

             <ajaxToolkit:TabPanel ID="TabPanel6" runat="server" HeaderText="SO(2)">
                 <ContentTemplate>
                     <strong>
                     <asp:Label ID="Label527" runat="server" Text="Terminowość sporządzania uzasadnień"></asp:Label>
                     &nbsp;<asp:Label ID="Label528" runat="server" Text="(od 1 stycznia 2013 do 31 marca 2016 r.) "></asp:Label>
                     &nbsp;<asp:Label ID="Label529" runat="server" Text="- SSR...  w Sądzie Okręgowym (w okresie delegacji)"></asp:Label>
                     <br />
                     </strong>
                     <table cellpadding="0" cellspacing="0" style="width:100%;" class="tabless02">
                         <tr>
                             <td style="width: 50px"></td>
                             <td><strong>
                                 <asp:Label ID="Label530" runat="server" Text="Razem sporządzonych uzasadnień"></asp:Label>
                                 </strong></td>
                             <td>
                                 <asp:Label ID="Label531" runat="server" Text="w tym w sprawach w których nie wniesiono środka zaskarżenia"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="Label532" runat="server" Text="w terminie"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="Label533" runat="server" Text="po terminie do 1 mies."></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="Label534" runat="server" Text="(w tym nieusprawiedliwione)"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="Label535" runat="server" Text="po terminie 1 do 3 mies."></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="Label539" runat="server" Text="(w tym nieusprawiedliwione)"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="Label537" runat="server" Text="po terminie pow. 3 mies."></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="Label540" runat="server" Text="(w tym nieusprawiedliwione)"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td class="auto-style4" style="width: 50px"><strong>
                                 <asp:Label ID="Label541" runat="server" Text="GC"></asp:Label>
                                 </strong></td>
                             <td class="auto-style4">
                                 <asp:Label ID="z6s1w1k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td class="auto-style4">
                                 <asp:Label ID="z6s1w1k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td class="auto-style4">
                                 <asp:Label ID="z6s1w1k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td class="auto-style4">
                                 <asp:Label ID="z6s1w1k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td class="auto-style4">
                                 <asp:Label ID="z6s1w1k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td class="auto-style4">
                                 <asp:Label ID="z6s1w1k6" runat="server" Text="0"></asp:Label>
                             </td>
                             <td class="auto-style4">
                                 <asp:Label ID="z6s1w1k7" runat="server" Text="0"></asp:Label>
                             </td>
                             <td class="auto-style4">
                                 <asp:Label ID="z6s1w1k8" runat="server" Text="0"></asp:Label>
                             </td>
                             <td class="auto-style4">
                                 <asp:Label ID="z6s1w1k9" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td style="width: 50px"><strong>
                                 <asp:Label ID="Label542" runat="server" Text="GNs"></asp:Label>
                                 </strong></td>
                             <td>
                                 <asp:Label ID="z6s1w2k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w2k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w2k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w2k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w2k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w2k6" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w2k7" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w2k8" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w2k9" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td style="width: 50px"><strong>
                                 <asp:Label ID="Label543" runat="server" Text="Ga"></asp:Label>
                                 </strong></td>
                             <td>
                                 <asp:Label ID="z6s1w3k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w3k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w3k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w3k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w3k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w3k6" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w3k7" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w3k8" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w3k9" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                         <tr>
                             <td style="width: 50px"><strong>
                                 <asp:Label ID="Label544" runat="server" Text="Gz"></asp:Label>
                                 </strong></td>
                             <td>
                                 <asp:Label ID="z6s1w4k1" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w4k2" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w4k3" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w4k4" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w4k5" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w4k6" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w4k7" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w4k8" runat="server" Text="0"></asp:Label>
                             </td>
                             <td>
                                 <asp:Label ID="z6s1w4k9" runat="server" Text="0"></asp:Label>
                             </td>
                         </tr>
                     </table>
                 </ContentTemplate>
              </ajaxToolkit:TabPanel>
              <ajaxToolkit:TabPanel ID="TabPanel7" runat="server" HeaderText="TabPanel7">
                  <HeaderTemplate>
                      SO(3<br /> )
                  </HeaderTemplate>
                  <ContentTemplate>

                      <asp:Label ID="Label588" runat="server" Font-Bold="True" Text="Wynik postępowania apelacyjnego (od 1 stycznia 2013 do 31 marca 2016 r.)"></asp:Label>
                      <br />
                      <table cellpadding="0" cellspacing="0">
                          <tr>
                              <td class="wideBox">&nbsp;</td>
                              <td class="middleBox">
                                  <asp:Label ID="Label545" runat="server" Text="SSR (del.)....."></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="Label546" runat="server" Text="%"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="Label547" runat="server" Text="Razem w wydziale"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="Label548" runat="server" Text="%"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label549" runat="server" Text="Wniesiono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s1w1k5" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s1w1k7" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s1w1k9" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s1w1k11" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label550" runat="server" Text="Rozpoznano"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s1w1k6" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s1w1k8" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s1w1k10" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s1w1k12" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label551" runat="server" Text="Utrzymano / Oddalono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s1w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s1w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s1w1k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s1w1k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label552" runat="server" Text="Uchylono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s1w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s1w2k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s1w2k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s1w2k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label553" runat="server" Text="Zmieniono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s1w3k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s1w3k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s1w3k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s1w3k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label554" runat="server" Text="Załatwiono w inny sposób"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s1w4k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s1w4k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s1w4k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s1w4k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td colspan="5" class="wideBoxLeft">&nbsp;</td>
                          </tr>
                          <tr>
                              <td colspan="5"><strong>
                                  <asp:Label ID="Label555" runat="server" Text="Wynik postępowania zażaleniowego"></asp:Label>
                                  &nbsp;</strong><asp:Label ID="dataLabelSR6" runat="server" Text="(od 1 stycznia 2013 do 31 marca 2016 r.)"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">&nbsp;</td>
                              <td class="middleBox">
                                  <asp:Label ID="Label556" runat="server" Text="SSR....."></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="Label557" runat="server" Text="%"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="Label558" runat="server" Text="Razem w wydziale"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="Label559" runat="server" Text="%"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label560" runat="server" Text="Wniesiono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s2w1k5" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s2w1k7" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s2w1k9" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s2w1k11" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label561" runat="server" Text="Rozpoznano"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s2w1k6" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s2w1k8" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s2w1k10" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s2w1k12" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label562" runat="server" Text="Utrzymano / Oddalono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s2w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s2w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s2w1k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s2w1k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label563" runat="server" Text="Uchylono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s2w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s2w2k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s2w2k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s2w2k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label564" runat="server" Text="Zmieniono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s2w3k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s2w3k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s2w3k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s2w3k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label565" runat="server" Text="Załatwiono w inny sposób"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s2w4k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s2w4k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z7s2w4k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z7s2w4k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td colspan="5" class="wideBoxLeft">&nbsp;</td>
                          </tr>
                          <tr>
                              <td colspan="5">
                                  <asp:Label ID="Label566" runat="server" Font-Bold="True" Text="Wskaźnik zaskarżalności"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">&nbsp;</td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="Label567" runat="server" Text="SSR..."></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="Label568" runat="server" Text="Razem w Wydziale"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label569" runat="server" Text="liczba spraw załatwionych podlegających zaskarżeniu"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s3w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s3w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label570" runat="server" Text="liczba wniesionych apelacji"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s3w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s3w2k2" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label571" runat="server" Text="wskaźnik zaskarżalności"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s3w3k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s3w3k2" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td colspan="5" class="wideBoxLeft">&nbsp;</td>
                          </tr>
                          <tr>
                              <td colspan="5">
                                  <asp:Label ID="Label572" runat="server" Font-Bold="True" Text="Wskaźnik stabilności"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">&nbsp;</td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="Label573" runat="server" Text="SSR..."></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="Label574" runat="server" Text="Razem w wydziale"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label575" runat="server" Text="liczba spraw załatwionych podlegających zaskarżeniu"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s4w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s4w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label576" runat="server" Text="liczba spraw, w których orzeczenia zostały zmienione lub uchylone"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s4w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s4w2k2" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label577" runat="server" Text="wskaźnik stabilności"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s4w3k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s4w3k2" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>

                          <tr>
                              <td class="wideBoxLeft">&nbsp;</td>
                              <td colspan="2">&nbsp;</td>
                              <td colspan="2">&nbsp;</td>
                          </tr>

                          <tr>
                              <td class="blackBox" colspan="3">
                                  <strong>
                                  <asp:Label ID="Label2" runat="server" Text="Liczba spraw z referatu, w których została złożona i uwzględniona skarga w trybie ustawy z dnia 17 czerwca 2004 o skardze na naruszenie prawa strony"></asp:Label>
                                  </strong>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s5w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>

                            <tr>
                              <td class="blackBox" colspan="3">
                                  <asp:Label ID="Label9" runat="server" Text="Liczba spraw z referatu, w których doszło do stwierdzenia niezgodności z prawem prawomocnego orzeczenia"></asp:Label>
                              </td>
                              <td class="wideBox" colspan="2">
                                  <asp:Label ID="z7s5w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                      </table>
                  </ContentTemplate>
              </ajaxToolkit:TabPanel>
              <ajaxToolkit:TabPanel ID="TabPanel8" runat="server" HeaderText="TabPanel8">
                  <HeaderTemplate>
                      S0(4)
                  </HeaderTemplate>
                  <ContentTemplate>

                      <br />
                      <table cellpadding="0" cellspacing="0">
                          <tr>
                              <td class="wideBox">&nbsp;</td>
                              <td class="middleBox">
                                  <asp:Label ID="Label578" runat="server" Text="SSR....."></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="Label579" runat="server" Text="%"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="Label580" runat="server" Text="Razem w wydziale"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="Label581" runat="server" Text="%"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label582" runat="server" Text="Liczba wniesionych skarg kasacyjnych"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z8s1w1k5" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z8s1w1k7" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z8s1w1k9" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z8s1w1k11" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label583" runat="server" Text="Rozpoznano"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z8s1w1k6" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z8s1w1k8" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z8s1w1k10" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z8s1w1k12" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label584" runat="server" Text="Utrzymano / Oddalono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z8s1w1k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z8s1w1k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z8s1w1k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z8s1w1k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label585" runat="server" Text="Uchylono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z8s1w2k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z8s1w2k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z8s1w2k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z8s1w2k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label586" runat="server" Text="Zmieniono"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z8s1w3k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z8s1w3k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z8s1w3k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z8s1w3k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                          <tr>
                              <td class="wideBoxLeft">
                                  <asp:Label ID="Label587" runat="server" Text="Załatwiono w inny sposób"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z8s1w4k1" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z8s1w4k2" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="middleBox">
                                  <asp:Label ID="z8s1w4k3" runat="server" Text="0"></asp:Label>
                              </td>
                              <td class="smallBox">
                                  <asp:Label ID="z8s1w4k4" runat="server" Text="0"></asp:Label>
                              </td>
                          </tr>
                      </table>

                  </ContentTemplate>
              </ajaxToolkit:TabPanel>
             </ajaxToolkit:TabContainer>

          
         

     </div>
  
  
    <div id="debag" >
          <br />
    <asp:Label ID="Label11" runat="server"></asp:Label>
   
        </div>
  
       
  </div>

    </asp:Content>

