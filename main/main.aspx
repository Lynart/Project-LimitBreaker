<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main_main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    <title>Website Horizontal Scrolling with jQuery</title>
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
        color: #fff;
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
            MY Spectre around me night and day
                Like a wild beast guards my way;
                My Emanation far within
                Weeps incessantly for my sin.
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
        <h2>Become a Limit Breaker!</h2>
        <p>
            ‘A fathomless and boundless deep,
                There we wander, there we weep;
                On the hungry craving wind
                My Spectre follows thee behind.

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
        <h2>Start tracking your exercises</h2>
        <h4>...or create your own routines and track those!</h4>
        <p>
            ‘He scents thy footsteps in the snow
                Wheresoever thou dost go,
                Thro’ the wintry hail and rain.
                When wilt thou return again?

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
            ‘He scents thy footsteps in the snow
                Wheresoever thou dost go,
                Thro’ the wintry hail and rain.
                When wilt thou return again?

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
        <h2>Participate in the leaderboards to earn medals</h2>
        <h4>...or make and strive for your own goals</h4>
        <p>
            ‘He scents thy footsteps in the snow
                Wheresoever thou dost go,
                Thro’ the wintry hail and rain.
                When wilt thou return again?

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
            ‘He scents thy footsteps in the snow
                Wheresoever thou dost go,
                Thro’ the wintry hail and rain.
                When wilt thou return again?

        </p>
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
