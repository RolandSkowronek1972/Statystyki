<%@ Page Title="" Language="C#" UICulture="pl" Culture="pl-PL" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="wab.aspx.cs" Inherits="Statystyki_2018.wab" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.17.0,  Culture=neutral,  PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <style>
  
#menu {
    position:relative;
}
#menu.scrolling {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
}


    </style>
    
      <script src="Scripts/jquery.print.js"></script>


    <script src="Scripts/rls.js"></script>
    <script> 
        function printIt()
        {
            window.print();
        }

    </script>
  
      <div class="noprint" >  
       <div id="menu" style="background-color: #f7f7f7;z-index:9999">
        <div class="manu_back" style="height: 40px; margin: 0 auto 0 auto; position:relative;  width: 1050px;    left: 0px;">               
   <table >
        <tr>
            <td style="width:auto;padding-left:5px;">
                <asp:Label ID="Label4" runat="server" Text="Proszę wybrać zakres:"></asp:Label>
            </td>
            <td style="width:auto;padding-left:5px;">

                <dx:ASPxDateEdit ID="Date1" runat="server" Theme="Moderno">
                </dx:ASPxDateEdit>
              


            </td>
            <td style="width:auto;padding-left:5px;">
               
                       <dx:ASPxDateEdit ID="Date2" runat="server" Theme="Moderno">
                </dx:ASPxDateEdit></td>
            <td style="width:auto;padding-left:5px;" >
                <asp:LinkButton ID="LinkButton54" runat="server" class="ax_box" OnClick="LinkButton54_Click">  Odśwież</asp:LinkButton>
            </td>
            <td style="width:auto;padding-left:5px;" class="az">
                  <button id="Button1" class="ax_box " onclick="printIt()" >Drukuj</button>
            </td>
            <td style="width:auto;padding-left:5px;">
                
                &nbsp;</td>
            <td style="width:auto;padding-left:5px;">
                 <asp:LinkButton ID="LinkButton57" runat="server" CssClass="ax_box" OnClick="Button3_Click">Zapisz do Excel</asp:LinkButton>
            </td>
        </tr>
    
    </table>
            </div>
      </div>
     </div>  
    

   <div style="width:1150px; margin: 0 auto 0 auto; position:relative;top:60px;" >



     <div id="Div2"  style="z-index:10; "> 
        <div style="margin-left:auto;margin-right:auto;text-align: center; width:auto; "> 
            <asp:Label ID="Label3" runat="server" Text="Sąd " style="font-weight: 700"></asp:Label>
            <br />
            <asp:Label ID="lbTabela01" runat="server">Tabela przedstawiająca terminowość przyznawania wynagrodzenia biegłym i tłumaczom oraz skierowania wydanych w tym zakresie orzeczeń do wykonania w sądownictwie powszechnym </asp:Label>
         </div> 
  

         <table border="0" class="noSpacing borderAll" style="width:100%;">
             <tr>
                 <td class="borderAll col_100" rowspan="3">Sąd / Wydział</td>
                 <td class="borderAll col_100" rowspan="3">Złożone wnioski o przyznanie wynagrodzenia biegłemu (tłumaczowi)</td>
                 <td class="borderAll center" colspan="5">Rozpoznane wnioski o przyznanie wynagrodzenia biegłemu (tłumaczowi), licząc od daty wpływu wniosku </td>
                 <td class="borderAll center" colspan="5">Wnioski przekazane do oddziału finansowego, licząc od daty uprawomocnienia orzeczenia </td>
             </tr>
             <tr>
                 <td class="borderAll col_95 center " rowspan="2">Razem</td>
                 <td class="borderAll center" colspan="4">W tym w terminie</td>
                 <td class="borderAll col_95 center" rowspan="2">Razem</td>
                 <td class="borderAll center" colspan="4">W tym w terminie</td>
             </tr>
             <tr>
                 <td class="borderLeft col_95 center">do 14 dni </td>
                 <td class="borderLeft col_95 center">pow. 14 do 30 dni</td>
                 <td class="borderLeft col_95 center">powyżej 30 dni</td>
                 <td class="borderLeft col_95 center">% powyżej <br/>30 dni do razem </td>
                 <td class="borderAll col_95 center">do 14 dni </td>
                 <td class="borderAll col_95 center">pow. 14 do 30 dni</td>
                 <td class="borderAll col_95 center">powyżej 30 dni</td>
                 <td class="borderAll col_95 center">% powyżej 30<br/> dni do razem </td>
             </tr>
             <tr>
                 <td class="borderAll center col_100"> <a href="javascript:openPopup('popup.aspx?sesja=1!1!1!3')"><asp:Label ID="tab_01_w01_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a>
                     
                 </td>
                 <td class="borderAll center col_100">
                <a href="javascript:openPopup('popup.aspx?sesja=1!1!2!3')"><asp:Label ID="tab_01_w01_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a>
                 </td>
                 <td class="borderAll center col_100">
                <a href="javascript:openPopup('popup.aspx?sesja=1!1!3!3')"><asp:Label ID="tab_01_w01_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a>
                 </td>
                 <td class="borderAll center col_100">
                <a href="javascript:openPopup('popup.aspx?sesja=1!1!4!3')"><asp:Label ID="tab_01_w01_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a>
                 </td>
                 <td class="borderAll center col_100">
                <a href="javascript:openPopup('popup.aspx?sesja=1!1!5!3')"><asp:Label ID="tab_01_w01_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a>
                 </td>
                 <td class="borderAll center col_100">
                <a href="javascript:openPopup('popup.aspx?sesja=1!1!6!3')"><asp:Label ID="tab_01_w01_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a>
                 </td>
                 <td class="borderAll center col_100">
                <a href="javascript:openPopup('popup.aspx?sesja=1!1!7!3')"><asp:Label ID="tab_01_w01_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a>
                 </td>
                 <td class="borderAll center col_100">
                <a href="javascript:openPopup('popup.aspx?sesja=1!1!8!3')"><asp:Label ID="tab_01_w01_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a>
                 </td>
                 <td class="borderAll center col_100">
                <a href="javascript:openPopup('popup.aspx?sesja=1!1!9!3')"><asp:Label ID="tab_01_w01_c09" CssClass="normal" runat="server" Text="0"></asp:Label> </a>
                 </td>
                 <td class="borderAll center col_100">
                <a href="javascript:openPopup('popup.aspx?sesja=1!1!10!3')"><asp:Label ID="tab_01_w01_c10" CssClass="normal" runat="server" Text="0"></asp:Label> </a>
                 </td>
                 <td class="borderAll center col_100">
                <a href="javascript:openPopup('popup.aspx?sesja=1!1!11!3')"><asp:Label ID="tab_01_w01_c11" CssClass="normal" runat="server" Text="0"></asp:Label> </a>
                 </td>
                 <td class="borderAll center col_100">
                <a href="javascript:openPopup('popup.aspx?sesja=1!1!12!3')"><asp:Label ID="tab_01_w01_c12" CssClass="normal" runat="server" Text="0"></asp:Label> </a>
                 </td>
             </tr>
         </table>
  

         <br />


     </div>
    

    <br />
           <div id="tab2"  class="page-break"> 
        <asp:Label ID="Label17" runat="server"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="infoLabel2" runat="server" Text="Tabela 2 \/" Visible="False"></asp:Label>
               <br />
               <table class="dxflInternalEditorTable_MaterialCompact">
                   <tr>
                       <td class="borderAll center col_80" rowspan="3">Sąd / Wydział </td>
                       <td class="borderAll center col_80" rowspan="3">Liczba złożonych wniosków o przyznanie wynagrodzenia biegłemu (tłumaczowi) </td>
                       <td class="borderAll center" colspan="4">Liczba rozpoznanych wniosków o przyznanie wynagrodzenia biegłemu (tłumaczowi), licząc od daty wpływu wniosku </td>
                       <td class="borderAll center" colspan="4">Liczba wniosków przekazanych do oddziału finansowego, licząc od daty uprawomocnienia orzeczenia </td>
                       <td class="borderAll center" colspan="4">Liczba wniosków, w których wypłacono wynagrodzenie biegłemu (tłumaczowi), licząc od daty przekazania dokumentacji do oddziału finansowego </td>
                   </tr>
                   <tr>
                       <td class="borderAll center col_80" rowspan="2">Razem</td>
                       <td class="borderAll center" colspan="3">w tym w terminie</td>
                       <td class="borderAll center col_80" rowspan="2">Razem</td>
                       <td class="borderAll center" colspan="3">w tym w terminie</td>
                       <td class="borderAll center col_80" rowspan="2">Razem</td>
                       <td class="borderAll center" colspan="3">w tym w terminie</td>
                   </tr>
                   <tr>
                       <td class="borderAll center col_80">do 7 dni</td>
                       <td class="borderAll center col_80">od 7 do 30 dni</td>
                       <td class="borderAll center col_80">powyżej 30 dni</td>
                       <td class="borderAll center col_80">do 7 dni</td>
                       <td class="borderAll center col_80">od 7 do 30 dni</td>
                       <td class="borderAll center col_80">powyżej 30 dni</td>
                       <td class="borderAll center col_80">do 7 dni</td>
                       <td class="borderAll center col_80">od 7 do 30 dni</td>
                       <td class="borderAll center col_80">powyżej 30 dni</td>
                   </tr>
                   <tr>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!1!3')"><asp:Label ID="tab_02_w01_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!2!3')"><asp:Label ID="tab_02_w01_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!3!3')"><asp:Label ID="tab_02_w01_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!4!3')"><asp:Label ID="tab_02_w01_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!5!3')"><asp:Label ID="tab_02_w01_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!6!3')"><asp:Label ID="tab_02_w01_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!7!3')"><asp:Label ID="tab_02_w01_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!8!3')"><asp:Label ID="tab_02_w01_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!9!3')"><asp:Label ID="tab_02_w01_c09" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!10!3')"><asp:Label ID="tab_02_w01_c10" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!11!3')"><asp:Label ID="tab_02_w01_c11" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!12!3')"><asp:Label ID="tab_02_w01_c12" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!13!3')"><asp:Label ID="tab_02_w01_c13" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_80"><a href="javascript:openPopup('popup.aspx?sesja=1!2!14!3')"><asp:Label ID="tab_02_w01_c14" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                   </tr>
               </table>
               <br />
        <br 
               aa
        </div>

           <div id="tab3"  class="page-break"> 
        <asp:Label ID="Label1" runat="server"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="InfoLabel3" runat="server" Text="Tabela 3 \/" Visible="False"></asp:Label>
               <br />
               <table class="dxflInternalEditorTable_MaterialCompact">
                   <tr>
                       <td class="borderAll center">Wysłano</td>
                       <td class="borderAll center">Zwrócono z opinią</td>
                       <td class="borderAll center">Zwrócono bez opinii</td>
                       <td class="borderAll center">Zwrócono po terminie</td>
                       <td class="borderAll center">Termin do sporządzenia przedłużono</td>
                       <td class="borderAll center">Ponaglono o wykonanie opinii</td>
                       <td class="borderAll center">W terminie 14 dni wydano post. o wynagrodzeniu</td>
                       <td class="borderAll center">Skierowano do wykonania w terminie 14 dni</td>
                   </tr>
                   <tr>
<td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!3!1!3')"><asp:Label ID="tab_03_w01_c01" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!3!2!3')"><asp:Label ID="tab_03_w01_c02" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!3!3!3')"><asp:Label ID="tab_03_w01_c03" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!3!4!3')"><asp:Label ID="tab_03_w01_c04" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!3!5!3')"><asp:Label ID="tab_03_w01_c05" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!3!6!3')"><asp:Label ID="tab_03_w01_c06" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!3!7!3')"><asp:Label ID="tab_03_w01_c07" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       <td class="borderAll center col_140"><a href="javascript:openPopup('popup.aspx?sesja=1!3!8!3')"><asp:Label ID="tab_03_w01_c08" CssClass="normal" runat="server" Text="0"></asp:Label> </a></td>
                       
                   </tr>
                   </table>
        <br />
        </div>

           <div id="tab4"  class="page-break"> 
        <asp:Label ID="Label2" runat="server"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="Tabela 4 \/" Visible="False"></asp:Label>
               <br />
             
 <table style="width: 100%; "> 
   <tr> 
  <td class="borderAll center" rowspan="3"> 
      Sąd</td > 
  <td class="borderAll center"> 
      ilość złożonych opinii , tłumaczeń 
  </td > 
  <td class="borderAll center" colspan="6"> 
      Rozpoznane wnioski o przyznanie wynagrodzenia biegłemu (tłumaczowi), licząc od&nbsp;daty wpływu wniosku</td > 
  <td class="borderAll center" colspan="6"> 
      ilość przypadków przekazania księgowości polecenia wypłaty wynagrodzenia biegłemu</td > 
   </tr> 
   <tr> 
  <td class="borderAll center" rowspan="2"> 
  </td > 
  <td class="borderAll center" rowspan="2"> 
      razem</td > 
  <td class="borderAll center" colspan="5"> 
      w tym w&nbsp;terminie</td > 
  <td class="borderAll center" rowspan="2"> 
      razem</td > 
  <td class="borderAll center" colspan="5"> 
      w tym w&nbsp;terminie</td > 
   </tr> 
   <tr> 
  <td class="borderAll center"> 
      do 14 dni</td > 
  <td class="borderAll center"> 
      pow.14 do 30 dni</td > 
  <td class="borderAll center"> 
      powyżej 30 dni do 3 m-cy</td > 
  <td class="borderAll center"> 
      powyżej 3 m-cy do 6 m-cy</td > 
  <td class="borderAll center"> 
      powyżej 6 m-cy</td > 
  <td class="borderAll center"> 
      do 14 dni</td > 
  <td class="borderAll center"> 
      pow.14 do 30 dni</td > 
  <td class="borderAll center"> 
      powyżej 30 dni do 3 m-cy</td > 
  <td class="borderAll center"> 
      powyżej 3 m-cy do 6 m-cy</td > 
  <td class="borderAll center"> 
      powyżej 6 m-cy</td > 
   </tr> 
   <tr> 
  <td class="col_81 borderAll"> 
      Sądy Rejonowe</td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!3!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!4!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!5!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!6!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!7!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!8!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!9!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!10!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!11!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!12!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!4!13!3')"><asp:Label CssClass="normal" ID="tab_4_w01_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_81 borderAll gray"> 
      rok 2018</td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!3!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!4!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!5!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!6!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!7!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!8!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!9!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!10!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!11!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!12!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!4!13!3')"><asp:Label CssClass="normal" ID="tab_4_w02_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_81 borderAll gray"> 
      I kwartał 2019</td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!3!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!4!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!5!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!6!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!7!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!8!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!9!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!10!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!11!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!12!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll gray"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!4!13!3')"><asp:Label CssClass="normal" ID="tab_4_w03_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_81 borderAll"> 
      <strong>RAZEM</strong></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!1!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!2!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!3!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c03" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!4!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c04" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!5!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c05" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!6!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c06" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!7!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c07" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!8!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c08" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!9!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c09" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!10!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c10" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!11!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c11" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!12!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c12" runat="server" Text="0"></asp:Label></a></td>
  <td class="col_81 borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=4!4!13!3')"><asp:Label CssClass="normal" ID="tab_4_w04_c13" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
 </table> 

        <br />
        </div>
       <div id="tab5"  class="page-break"> 
           <asp:Label ID="Label6" runat="server"></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label7" runat="server" Text="Tabela 5 \/" Visible="False"></asp:Label>
               <br />
           <table style="width: 100%; "> 
   <tr> 
  <td class="borderAll center" rowspan="2"> 
      Sąd</td > 
  <td class="borderAll center" rowspan="2"> 
      ilość niezrealizowanych wypłat wynagrodzeń wg stanu na 31 marca 2019 r. za okres 1 stycznia 2015 - 31 marca 2019 r.*</td > 
  <td class="borderAll center" rowspan="2"> 
      * przypadki 3 najstarszych niezrealizowanych wypłat, licząc od dnia złożenia opinii przez biegłego</td > 
  <td class="borderAll col_30 center"> 
      1</td > 
  <td class="borderAll col_81 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=1!5!3!3')"><asp:Label CssClass="normal" ID="tab_5_w01_c03" runat="server" Text="0"></asp:Label></a> 
  </td > 
   </tr> 
   <tr> 
  <td class="borderAll col_30 center"> 
      2</td>
  <td class="borderAll col_81 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=2!5!3!3')"><asp:Label CssClass="normal" ID="tab_5_w02_c03" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
   <tr> 
  <td class="col_81 borderAll"> 
      RAZEM</td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!5!1!3')"><asp:Label CssClass="normal" ID="tab_5_w03_c01" runat="server" Text="0"></asp:Label></a></td>
  <td class="center borderAll"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!5!2!3')"><asp:Label CssClass="normal" ID="tab_5_w03_c02" runat="server" Text="0"></asp:Label></a></td>
  <td class="borderAll col_30 center"> 
      3</td>
  <td class="borderAll col_81 center"> 
  <a href="javascript: openPopup('popup.aspx?sesja=3!5!3!3')"><asp:Label CssClass="normal" ID="tab_5_w03_c03" runat="server" Text="0"></asp:Label></a></td>
   </tr> 
 </table> 

           </div>

    <div id="debag" >
          <br />
     <br />
        Raport statystyczny 
                     <asp:Label ID="Label27" runat="server"></asp:Label>
                &nbsp;Sporzadzone dn.
            <asp:Label ID="Label29" runat="server"></asp:Label>&nbsp;przez&nbsp;
&nbsp;&nbsp;
            <asp:Label ID="Label28" runat="server"></asp:Label>
&nbsp;<asp:Label ID="Label30" runat="server"></asp:Label>
        <br />

        <asp:Label ID="Label11" runat="server"></asp:Label>
   

        </div>
    
 
    <br />
       
  </div>
    
</asp:Content>

