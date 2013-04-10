<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>Project Limit Breaker - Getting Started</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="description" content="Website Horizontal Scrolling with jQuery" />
    <meta name="keywords" content="jquery, horizontal, scrolling, scroll, smooth" />
    <link href="../ui/css/main_style.css" rel="stylesheet" media="screen" />
    <script type='text/javascript' src='http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js?ver=1.3.2'></script>
    <script type='text/javascript' src="../Scripts/jquery.mousewheel.min.js"></script>
</head>
<style type="text/css">
    body, html {
        background-color: #fff;
    }

    a {
        color: #5D7B9D;
        text-decoration: none;
    }

        a:hover {
            text-decoration: underline;
        }

    span.reference {
        position: fixed;
        left: 10px;
        bottom: 10px;
        font-size: 13px;
        font-weight: bold;
    }

        span.reference a {
            color: #fff;
            text-shadow: 1px 1px 1px #000;
            padding-right: 20px;
        }

            span.reference a:hover {
                color: #ddd;
                text-decoration: none;
            }

    body {
        overflow-x: hidden;
    }
</style>
<body>
    <div class="section white" id="section1">
        <h2>How do I get started?</h2>
        <p>
            From creating an account to learning what you can do it, this is the right page to be in 
        </p>
        <p>
            Continue on to learn how to make working out a fun gaming experience
        </p>
        <ul class="nav">
            <li>1</li>
            <li><a href="#section2">2</a></li>
            <li><a href="#section3">3</a></li>
            <li><a href="#section4">4</a></li>
            <li><a href="#section5">5</a></li>
            <li><a href="#section6">6</a></li>
        </ul>
    </div>
    <div class="section white" id="section2">
        <h2>Become a Limit Breaker</h2>
        <p>
            <a target="_blank" href="../User/createUser.aspx">Create an account</a> and set up your profile
        </p>
        <img src="../ui/images/gs_createAccount.png" alt="Account Creation" />
        <p>
            We need information such as your weight, height, age, and gender to produce the most accurate statistics when logging your data
        </p>
        <p>
            You are now on your way to breaking limits
        </p>
        <ul class="nav">
            <li><a href="#section1">1</a></li>
            <li>2</li>
            <li><a href="#section3">3</a></li>
            <li><a href="#section4">4</a></li>
            <li><a href="#section5">5</a></li>
            <li><a href="#section6">6</a></li>
        </ul>
    </div>
    <div class="section white" id="section3">
        <h2>Start tracking!</h2>
        <p>
            You can choose to track by recording a specific exercise or a set of exercises called a "routine"
        </p>
        <table>
            <tr>
                <td><a target="_blank" href="../LoggedExercise/default.aspx">Logging a specific exercise</a></td>
                <td><a target="_blank" href="../userRoutines/Default.aspx">Logging through routine manager</a></td>
            </tr>
            <tr>
                <td><img src="../ui/images/gs_exerciseTrack.png" alt="Track Exercise" /></td>
                <td><img src="../ui/images/gs_routineTrack.png" alt="Track Routine" /></td>
            </tr>
        </table>
        <p>
            Check out the <a target="_blank" href="../support.aspx">F.A.Q.</a> to learn more about routines, tracking, and scheduling
        </p>
        <ul class="nav">
            <li><a href="#section1">1</a></li>
            <li><a href="#section2">2</a></li>
            <li>3</li>
            <li><a href="#section4">4</a></li>
            <li><a href="#section5">5</a></li>
            <li><a href="#section6">6</a></li>
        </ul>
    </div>
    <div class="section white" id="section4">
        <h2>Level up!</h2>
        <p>
            You get levels based on the exercises you do. This shows how "strong" you have become and "attributes" you have attained
        </p>
        <table>
            <tr>
                <td><a target="_blank" href="../User/profile.aspx">Track your progress</a></td>
                <td><a target="_blank" href="../User/leaderboards.aspx">Check your rank</a></td>
                
            </tr>
            <tr>
                <td><img src="../ui/images/gs_profile.png" alt="User Profile" /></td>
                <td><img src="../ui/images/gs_leaderboards.png" alt="Leaderboards" /></td>
            </tr>
        </table>
        <p>
            Also check out the other players in the system and see how you fair with them
        </p>

        <ul class="nav">
            <li><a href="#section1">1</a></li>
            <li><a href="#section2">2</a></li>
            <li><a href="#section3">3</a></li>
            <li>4</li>
            <li><a href="#section5">5</a></li>
            <li><a href="#section6">6</a></li>
        </ul>
    </div>
    <div class="section white" id="section5">
        <h2>Earn medals!</h2>
        <p>
            Leveling is not the only thing to do in this system. Also earn medals based on your ranking
        </p>
        <img src="../ui/images/gs_medals.png" alt="Account Creation" />
        <p>
            You can even create your own goals if being ranked first is trivial to you
        </p>
        <ul class="nav">
            <li><a href="#section1">1</a></li>
            <li><a href="#section2">2</a></li>
            <li><a href="#section3">3</a></li>
            <li><a href="#section4">4</a></li>
            <li>5</li>
            <li><a href="#section6">6</a></li>
        </ul>
    </div>
    <div class="section white" id="section6">
        <h2>Good luck, Have fun!</h2>
        <p>
            You have learned enough to start using the system
        </p>
        <p>
            All you have to do now is to break your own personal limits, reach for the top, and accomplish your goals
        </p>
        <br />
        <p class="it">
            “The mind is the limit. 
        </p>
        <p class="it">
            As long as the mind can envision the fact that you can do something, you can do it, as long as you really believe 100 percent.” 
        </p>
        <p class="it">
             - Arnold Schwarzenegger
        </p>
        <img src="../ui/images/arnold-conquer.jpg" alt="Arnold Conquer" />
            <ul class="nav">
            <li><a href="#section1">1</a></li>
            <li><a href="#section2">2</a></li>
            <li><a href="#section3">3</a></li>
            <li><a href="#section4">4</a></li>
            <li><a href="#section5">5</a></li>
            <li>6</li>
        </ul>
    </div>

    <!-- The JavaScript -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script type="text/javascript" src="../../Scripts/jquery.easing.1.3.js"></script>
    <script type="text/javascript">
        $(function () {
            $('ul.nav a').bind('click', function (event) {
                var $anchor = $(this);
                /*
                if you want to use one of the easing effects:
                $('html, body').stop().animate({
                    scrollLeft: $($anchor.attr('href')).offset().left
                }, 1500,'easeInOutExpo');
                 */
                $('html, body').stop().animate({
                    scrollLeft: $($anchor.attr('href')).offset().left
                }, 1000);
                event.preventDefault();
            });
        });
        $(function () {

            $("body").mousewheel(function (event, delta) {

                this.scrollLeft -= (delta * 30);

                event.preventDefault();

            });

        });
    </script>
</body>
</html>
