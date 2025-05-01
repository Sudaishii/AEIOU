<?php

require_once 'vendor/autoload.php';

use Rodeliza\Dbmodel\Models\Post;

session_start();


$post = new Post();


if(isset($_POST['submit'])) {
    $post->addPost([
        'title' => $_POST['title'],
        'content' => $_POST['content'],
        'author_id' => $_POST['author_id']
    ]);
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add a Blog Post</title>
    <link rel="stylesheet" href="assets/css/styles.css">
</head>
<body>
    <form method="POST" action="blog.php" class="add-blog-form">
        <p>Hello, <?php echo htmlspecialchars($_SESSION['user']['first_name']); ?></p>
        <h1>Add a Blog Post</h1>
        <div class="form-group">
            <label for="title">Title</label>
            <input type="text" id="title" name="title" placeholder="Enter the blog title" required>
            <div class="validation-message" id="title-validation"></div>
        </div>
        <input type="hidden" name="author_id" value="<?php echo htmlspecialchars($_SESSION['user']['id']); ?>">
        <div class="form-group">
            <label for="content">Content</label>
            <textarea id="content" name="content" placeholder="Write your blog content here..." rows="10" required></textarea>
            <div class="validation-message" id="content-validation"></div>
        </div>
        <input type="submit" name="submit" value="Submit">
    </form>
</body>
</html>
