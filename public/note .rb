<form action="/users/<%= @user.id %>" method="POST">

# <a href="/guest/<%=@guest.id %>/delete" >Delete guest <a/>

# <form action="/users/<%= @user.id %>/delete" method="POST">
# <input id="hidden"  type="hidden" name="_method" value="DELETE" />
# <input id="submit" value= "Delete"/>
# <ul>
# </form>




edit
<form action='/guests/<%= @guest.id %>'  method='PATCH'>
 <input id="hidden" type="hidden" name="_method" value="update">


 <li>
 <input type='submit' value="update" />
 </li>
 
</form> 


height="160" 