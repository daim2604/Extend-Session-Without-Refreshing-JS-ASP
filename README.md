# Extend-Session-Without-Refreshing-JS-ASP
<h2>Language : Vanilla Javascript + ASP Classic (Serverside Language) <br/>
Extending session without refreshing the pages. 
</h2> <br/>

<h3>Should work with any serverside language (I think)</h4>

<br/>
<h4>Two things to note :</h4> 

Idle Time   : How long before the prompt pop up. <br/>
Buffer Time : How long before the page automatically logged out if there is no response.<br/>

Idle - Refer to when user is away from keyboard or when user hasn't been sending/request anything to/from the server.<br/>

<h4>Features : </h4>
1. A prompt asking the user to continue or logout.<br/>
2. Buffer countdown in the popup (If there is no response from user during prompt, page will automatically time out when buffer reach 0).<br/>
3. Reset session without refreshing page (XMLHttp AJAX)<br/>

<h4>Flow :</h4>
1. After user idle according to how long you set, a prompt will pop up asking user wether to continue or log out.<br/>
2. Should user decide to continue, a process in the back will send a request to the server, with that, the session is now reset and the user can continue to use it.<br/>
3. If user press the logout button, the page will be redirected to the logout page.<br/>
4. Or if the user didn't respond to the popup after the buffer countdown reach 0, the page will be redirected to logoutpage. <br/>
<br/><br/>
The countdown code is 100% in Vanila Javascript, except for the page to reset timeout since it is serverside.<br/>
<br/>
I'm a beginner programmer. <br/>
Feedback and comments appreciated.<br/>
Thanks
