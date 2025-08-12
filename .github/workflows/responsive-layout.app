<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Social App - Responsive Layout</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        :root {
            --primary: #1d9bf0;
            --secondary: #15202b;
            --text: #ffffff;
            --text-secondary: #8899a6;
            --border: #38444d;
            --card-bg: #192734;
            --hover: #22303c;
        }

        body {
            background-color: var(--secondary);
            color: var(--text);
            min-height: 100vh;
        }

        /* Container layout */
        .container {
            display: grid;
            grid-template-columns: 1fr;
            grid-template-rows: auto 1fr auto;
            grid-template-areas: 
                "header"
                "main"
                "bottom-nav";
            height: 100vh;
            max-width: 2000px;
            margin: 0 auto;
        }

        /* Header styles */
        .header {
            grid-area: header;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem;
            border-bottom: 1px solid var(--border);
            background-color: var(--secondary);
            position: sticky;
            top: 0;
            z-index: 100;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: bold;
            color: var(--primary);
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .logo i {
            color: var(--primary);
        }

        .search-container {
            display: none;
            position: relative;
        }

        .search-container input {
            background-color: var(--card-bg);
            border: 1px solid var(--border);
            border-radius: 20px;
            padding: 0.7rem 1rem 0.7rem 2.5rem;
            color: var(--text);
            width: 100%;
            max-width: 300px;
        }

        .search-container i {
            position: absolute;
            left: 1rem;
            top: 50%;
            transform: translateY(-50%);
            color: var(--text-secondary);
        }

        .user-actions {
            display: flex;
            gap: 1rem;
            align-items: center;
        }

        .user-actions button {
            background: none;
            border: none;
            color: var(--text);
            font-size: 1.2rem;
            cursor: pointer;
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .user-actions button:hover {
            background-color: var(--hover);
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: linear-gradient(45deg, var(--primary), #8b5cf6);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        /* Main content area */
        .main {
            grid-area: main;
            display: grid;
            grid-template-columns: 1fr;
            overflow-y: auto;
            padding-bottom: 1rem;
        }

        /* Left sidebar */
        .sidebar {
            display: none;
            flex-direction: column;
            padding: 1rem 0.5rem;
            border-right: 1px solid var(--border);
        }

        .nav-item {
            display: flex;
            align-items: center;
            padding: 0.8rem 1rem;
            margin: 0.25rem 0;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.2s;
            font-size: 1.1rem;
            font-weight: 500;
        }

        .nav-item:hover, .nav-item.active {
            background-color: var(--hover);
        }

        .nav-item i {
            margin-right: 1rem;
            font-size: 1.4rem;
            width: 26px;
            text-align: center;
        }

        .nav-item.active i {
            color: var(--primary);
        }

        .post-btn {
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 30px;
            padding: 0.8rem 1rem;
            margin-top: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.5rem;
            font-size: 1rem;
        }

        .post-btn:hover {
            background-color: #1a8cd8;
        }

        /* Feed content */
        .feed {
            padding: 1rem;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .create-post {
            background-color: var(--card-bg);
            border-radius: 15px;
            padding: 1rem;
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .post-header {
            display: flex;
            gap: 1rem;
        }

        .post-input {
            background-color: var(--secondary);
            border: 1px solid var(--border);
            border-radius: 15px;
            padding: 1rem;
            color: var(--text);
            resize: none;
            flex-grow: 1;
            font-size: 1rem;
            min-height: 80px;
        }

        .post-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .media-options {
            display: flex;
            gap: 1rem;
            color: var(--primary);
        }

        .media-options i {
            cursor: pointer;
            font-size: 1.2rem;
        }

        .post-submit {
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 20px;
            padding: 0.5rem 1.5rem;
            font-weight: bold;
            cursor: pointer;
        }

        .post-card {
            background-color: var(--card-bg);
            border-radius: 15px;
            padding: 1.5rem;
            display: flex;
            gap: 1rem;
        }

        .post-content {
            flex-grow: 1;
        }

        .post-user {
            display: flex;
            gap: 0.5rem;
            align-items: center;
            margin-bottom: 0.5rem;
        }

        .post-name {
            font-weight: bold;
        }

        .post-username, .post-time {
            color: var(--text-secondary);
        }

        .post-text {
            margin: 0.75rem 0;
            line-height: 1.5;
        }

        .post-stats {
            display: flex;
            justify-content: space-between;
            margin-top: 1rem;
            color: var(--text-secondary);
        }

        .post-actions {
            display: flex;
            gap: 3rem;
        }

        .post-action {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            cursor: pointer;
            transition: color 0.2s;
        }

        .post-action:hover {
            color: var(--primary);
        }

        /* Right sidebar */
        .right-sidebar {
            display: none;
            padding: 1rem;
            border-left: 1px solid var(--border);
        }

        .sidebar-card {
            background-color: var(--card-bg);
            border-radius: 15px;
            padding: 1.5rem;
            margin-bottom: 1rem;
        }

        .sidebar-title {
            font-size: 1.2rem;
            margin-bottom: 1rem;
            font-weight: bold;
        }

        .trending-item {
            padding: 0.8rem 0;
            border-bottom: 1px solid var(--border);
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .trending-item:last-child {
            border-bottom: none;
        }

        .trending-item:hover {
            background-color: var(--hover);
        }

        .trending-category {
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        .trending-name {
            font-weight: bold;
            margin: 0.25rem 0;
        }

        .trending-stats {
            color: var(--text-secondary);
            font-size: 0.9rem;
        }

        .suggested-user {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 0.8rem 0;
        }

        .user-info {
            flex-grow: 1;
        }

        .follow-btn {
            background: none;
            border: 1px solid var(--primary);
            color: var(--primary);
            border-radius: 20px;
            padding: 0.3rem 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .follow-btn:hover {
            background-color: rgba(29, 155, 240, 0.1);
        }

        /* Bottom navigation */
        .bottom-nav {
            grid-area: bottom-nav;
            display: flex;
            justify-content: space-around;
            align-items: center;
            background-color: var(--secondary);
            border-top: 1px solid var(--border);
            padding: 0.8rem 0;
            position: sticky;
            bottom: 0;
            z-index: 100;
        }

        .nav-icon {
            display: flex;
            flex-direction: column;
            align-items: center;
            color: var(--text-secondary);
            font-size: 0.9rem;
            cursor: pointer;
        }

        .nav-icon i {
            font-size: 1.4rem;
            margin-bottom: 0.25rem;
        }

        .nav-icon.active {
            color: var(--primary);
        }

        .nav-icon:hover {
            color: var(--primary);
        }

        /* Responsive design */
        @media (min-width: 768px) {
            .container {
                grid-template-columns: 240px 1fr;
                grid-template-areas: 
                    "sidebar header"
                    "sidebar main"
                    "bottom-nav main";
            }
            
            .sidebar {
                display: flex;
                grid-area: sidebar;
            }
            
            .bottom-nav {
                display: none;
            }
            
            .main {
                grid-template-columns: 1fr;
            }
            
            .search-container {
                display: block;
                flex-grow: 1;
                max-width: 400px;
                margin: 0 1.5rem;
            }
        }

        @media (min-width: 1024px) {
            .container {
                grid-template-columns: 260px 1fr 320px;
                grid-template-areas: 
                    "sidebar header right-sidebar"
                    "sidebar main right-sidebar"
                    "sidebar main right-sidebar";
            }
            
            .right-sidebar {
                display: block;
                grid-area: right-sidebar;
                overflow-y: auto;
            }
            
            .main {
                grid-template-columns: minmax(0, 700px);
                justify-content: center;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <header class="header">
            <div class="logo">
                <i class="fab fa-twitter"></i>
                <span>SocialApp</span>
            </div>
            <div class="search-container">
                <i class="fas fa-search"></i>
                <input type="text" placeholder="Search...">
            </div>
            <div class="user-actions">
                <button><i class="far fa-bell"></i></button>
                <button><i class="far fa-envelope"></i></button>
                <div class="user-profile">
                    <div class="avatar">JS</div>
                </div>
            </div>
        </header>
        
        <!-- Left Sidebar -->
        <aside class="sidebar">
            <div class="nav-item active">
                <i class="fas fa-home"></i>
                <span>Home</span>
            </div>
            <div class="nav-item">
                <i class="fas fa-hashtag"></i>
                <span>Explore</span>
            </div>
            <div class="nav-item">
                <i class="far fa-bell"></i>
                <span>Notifications</span>
            </div>
            <div class="nav-item">
                <i class="far fa-envelope"></i>
                <span>Messages</span>
            </div>
            <div class="nav-item">
                <i class="far fa-bookmark"></i>
                <span>Bookmarks</span>
            </div>
            <div class="nav-item">
                <i class="far fa-user"></i>
                <span>Profile</span>
            </div>
            <div class="nav-item">
                <i class="fas fa-ellipsis-h"></i>
                <span>More</span>
            </div>
            <button class="post-btn">
                <i class="fas fa-feather-alt"></i>
                <span>Post</span>
            </button>
        </aside>
        
        <!-- Main Content -->
        <main class="main">
            <div class="feed">
                <!-- Create Post -->
                <div class="create-post">
                    <div class="post-header">
                        <div class="avatar">JS</div>
                        <textarea class="post-input" placeholder="What's happening?"></textarea>
                    </div>
                    <div class="post-actions">
                        <div class="media-options">
                            <i class="far fa-image"></i>
                            <i class="fas fa-poll"></i>
                            <i class="far fa-smile"></i>
                            <i class="far fa-calendar"></i>
                        </div>
                        <button class="post-submit">Post</button>
                    </div>
                </div>
                
                <!-- Posts -->
                <div class="post-card">
                    <div class="avatar">MJ</div>
                    <div class="post-content">
                        <div class="post-user">
                            <span class="post-name">Michael Johnson</span>
                            <span class="post-username">@michaelj ·</span>
                            <span class="post-time">2h</span>
                        </div>
                        <p class="post-text">Just launched my new website! Built with modern responsive design principles. Check it out and let me know what you think! #webdesign #responsive</p>
                        <div class="post-stats">
                            <div class="post-actions">
                                <div class="post-action">
                                    <i class="far fa-comment"></i>
                                    <span>24</span>
                                </div>
                                <div class="post-action">
                                    <i class="fas fa-retweet"></i>
                                    <span>156</span>
                                </div>
                                <div class="post-action">
                                    <i class="far fa-heart"></i>
                                    <span>312</span>
                                </div>
                                <div class="post-action">
                                    <i class="far fa-share-square"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="post-card">
                    <div class="avatar">SD</div>
                    <div class="post-content">
                        <div class="post-user">
                            <span class="post-name">Sarah Davis</span>
                            <span class="post-username">@sarahdesign ·</span>
                            <span class="post-time">4h</span>
                        </div>
                        <p class="post-text">Creating responsive layouts is easier than ever with modern CSS. Grid and Flexbox are game changers! What's your favorite layout technique? #CSS #webdev</p>
                        <div class="post-stats">
                            <div class="post-actions">
                                <div class="post-action">
                                    <i class="far fa-comment"></i>
                                    <span>42</span>
                                </div>
                                <div class="post-action">
                                    <i class="fas fa-retweet"></i>
                                    <span>89</span>
                                </div>
                                <div class="post-action">
                                    <i class="far fa-heart"></i>
                                    <span>204</span>
                                </div>
                                <div class="post-action">
                                    <i class="far fa-share-square"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="post-card">
                    <div class="avatar">AK</div>
                    <div class="post-content">
                        <div class="post-user">
                            <span class="post-name">Alex Kim</span>
                            <span class="post-username">@akdev ·</span>
                            <span class="post-time">6h</span>
                        </div>
                        <p class="post-text">Mobile-first design isn't just a trend, it's a necessity. With over 60% of web traffic coming from mobile devices, responsive design should be your top priority. #responsive #mobilefirst</p>
                        <div class="post-stats">
                            <div class="post-actions">
                                <div class="post-action">
                                    <i class="far fa-comment"></i>
                                    <span>18</span>
                                </div>
                                <div class="post-action">
                                    <i class="fas fa-retweet"></i>
                                    <span>73</span>
                                </div>
                                <div class="post-action">
                                    <i class="far fa-heart"></i>
                                    <span>168</span>
                                </div>
                                <div class="post-action">
                                    <i class="far fa-share-square"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        <!-- Right Sidebar -->
        <aside class="right-sidebar">
            <div class="sidebar-card">
                <h3 class="sidebar-title">Trends for you</h3>
                <div class="trending-item">
                    <div class="trending-category">Technology · Trending</div>
                    <div class="trending-name">#ResponsiveDesign</div>
                    <div class="trending-stats">15.2K posts</div>
                </div>
                <div class="trending-item">
                    <div class="trending-category">Development · Trending</div>
                    <div class="trending-name">CSS Grid</div>
                    <div class="trending-stats">8.7K posts</div>
                </div>
                <div class="trending-item">
                    <div class="trending-category">Programming · Trending</div>
                    <div class="trending-name">Flexbox</div>
                    <div class="trending-stats">5.3K posts</div>
                </div>
                <div class="trending-item">
                    <div class="trending-category">Web · Trending</div>
                    <div class="trending-name">Mobile First</div>
                    <div class="trending-stats">3.9K posts</div>
                </div>
            </div>
            
            <div class="sidebar-card">
                <h3 class="sidebar-title">Who to follow</h3>
                <div class="suggested-user">
                    <div class="avatar">WD</div>
                    <div class="user-info">
                        <div class="post-name">Web Design Weekly</div>
                        <div class="post-username">@webdesignnews</div>
                    </div>
                    <button class="follow-btn">Follow</button>
                </div>
                <div class="suggested-user">
                    <div class="avatar">CD</div>
                    <div class="user-info">
                        <div class="post-name">CSS Tricks</div>
                        <div class="post-username">@css</div>
                    </div>
                    <button class="follow-btn">Follow</button>
                </div>
                <div class="suggested-user">
                    <div class="avatar">DR</div>
                    <div class="user-info">
                        <div class="post-name">Design Resources</div>
                        <div class="post-username">@designresources</div>
                    </div>
                    <button class="follow-btn">Follow</button>
                </div>
            </div>
        </aside>
        
        <!-- Bottom Navigation (Mobile) -->
        <nav class="bottom-nav">
            <div class="nav-icon active">
                <i class="fas fa-home"></i>
                <span>Home</span>
            </div>
            <div class="nav-icon">
                <i class="fas fa-search"></i>
                <span>Search</span>
            </div>
            <div class="nav-icon">
                <i class="far fa-bell"></i>
                <span>Notifications</span>
            </div>
            <div class="nav-icon">
                <i class="far fa-envelope"></i>
                <span>Messages</span>
            </div>
        </nav>
    </div>
</body>
</html>
