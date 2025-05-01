<?php

require_once 'vendor/autoload.php';

use Rodeliza\Dbmodel\Models\Post;

session_start();

$post = new Post();

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Users</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
    <nav class="navbar">
        <a href="index.php">Home</a>
        <?php if (isset($_SESSION['user'])): ?>
            <a href="blog.php" class="btn">Add Blog Post</a>
            <a href="logout.php" class="btn">Logout</a>
        <?php else: ?>
            <a href="login.php">Log In</a>
            <a href="register.php">Register</a>
        <?php endif; ?>
    </nav>
    <div class="blog-container">
        <div class="header-flex">
            <h1>All Blog Posts</h1>
            <?php if (isset($_SESSION['user'])): ?>
                <a href="blog.php" class="btn add-post-btn">Add Blog Post</a>
            <?php endif; ?>
        </div>
        <h2 class="welcome-message">Welcome <?php echo $_SESSION['user']['first_name'] ?? 'Guest'; ?></h2>
    </div>
    <div class="blog-container">
    <?php
        if (isset($_SESSION['user'])) {
            // Show posts by logged-in user only
            $posts = $post->getPostsByLoggedInUser($_SESSION['user']['id']);
        } else {
            // Show recent posts from all users
            $posts = $post->getPosts();
        }
        foreach ($posts as $key => $value) {
            echo '<div class="blog-post">';
            echo '<h3 class="blog-title">' . htmlspecialchars($value['title']) . '</h3>';
            // Optionally add more post details here
            echo '<p class="blog-excerpt">' . htmlspecialchars(substr($value['content'], 0, 200)) . '...</p>';
            echo '<div class="blog-footer">Posted on ' . date('F j, Y', strtotime($value['created_at'] ?? 'now')) . '</div>';
            echo '</div>';
        }
    ?>
    </div>
</body>
</html>
