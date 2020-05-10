
<#orm action="/guests/<%=@guest.id %>/delete" method="POST">
 <#input id="hidden"  type="hidden" name="_method" value="DELETE" />
 <#input id="submit" value= "Delete"/>
 <#ul>
 <#/form>


<#a href="/guest/<%= @guest.id %>/edit" >Edit guest <a/>

<#form action="/guests/<%=@guest.id %>/edit" method="POST">
<#input id="hidden"  type="hidden" name="_method" value="EDIT" />
<#input id="submit" value= "EDIT"/>
<#ul>
<#/form>