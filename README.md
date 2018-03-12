# Extend-Session-Without-Refreshing-JS-ASP
<h2>Language : Vanilla Javascript + ASP Classic (Serverside Language) <br/>
Extending session without refreshing the pages. 
</h2>
<h4>Two things to note :</h4> 

Idle Time   : How long before the prompt pop up. 
Buffer Time : How long before the page automatically logged out if there is no response.

Idle - Refer to when user is away from keyboard or when user hasn't been sending/request anything to/from the server.

<h4>Features : </h4>
1. A prompt asking the user to continue or logout.
2. Buffer countdown in the popup (If there is no response from user during prompt, page will automatically time out when buffer reach 0).
3. Reset session without refreshing page (XMLHttp AJAX)

<h4>Flow :</h4>
1. After user idle according to how long you set, a prompt will pop up asking user wether to continue or log out.
2. Should user decide to continue, a process in the back will send a request to the server, with that, the session is now reset and the user can continue to use it.
3. If user press the logout button, the page will be redirected to the logout page.
4. Or if the user didn't respond to the popup after the buffer countdown reach 0, the page will be redirected to logoutpage. 

The countdown code is 100% in Vanila Javascript, except for the page to reset timeout since it is serverside.

I'm a beginner programmer. 
Feedback and comments appreciated.
Thanks
