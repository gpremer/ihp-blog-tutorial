module Web.View.Posts.Show where
import Web.View.Prelude
import qualified Text.MMark as MMark

data ShowView = ShowView { post :: Include "comments" Post
                         , hasComments :: Bool }

instance View ShowView where
    html ShowView { .. } = [hsx|
        {breadcrumb}
        <h1>{post.title}</h1>
        <p>{post.createdAt |> timeAgo}</p>
        <div>{post.body |> renderMarkdown}</div>
        <div><a href={EditPostAction post.id} class="text-muted">Edit</a></div>
        <div><a href={NewCommentAction post.id} class="text-muted">New comment</a></div>
        {comments}
    |]
        where
            breadcrumb = renderBreadcrumb
                            [ breadcrumbLink "Posts" PostsAction
                            , breadcrumbText "Show Post"
                            ]
            comments = case isEmpty post.comments of
                True -> [hsx| <div>No comments yet</div> |]
                False -> [hsx| 
                    <h2>Comments</h2>
                    <div>{forEach post.comments renderComment}</div>
                |]

renderMarkdown text = 
    case text |> MMark.parse "" of
        Left error -> "Something went wrong"
        Right markdown -> MMark.render markdown |> tshow |> preEscapedToHtml

renderComment comment = [hsx|
        <div class="mt-4">
            <h5>{comment.author}</h5>
            <p>{comment.body}</p>
        </div>
    |]