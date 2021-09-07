<#import "parts/common.ftlh" as c>
<@c.page>
    <form class="row row-cols-lg-auto g-3" method="get" action="/main">
        <div class="col-12">
            <input class="form-control mb-3" type="text" name="filter" value="${filter!}">
        </div>
        <div class="col-12">
            <button class="btn btn-primary" type="submit">Search</button>
        </div>
    </form>
    <a class="btn btn-primary mb-3" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>
    <div class = "collapse" id="collapseExample">
        <form method="post" enctype="multipart/form-data">
            <div class="input-group">
                <input class="form-control mb-3" type = "text" name = "text" placeholder="Введите сообщение" />
            </div>
            <div class="input-group">
                <input class="form-control mb-3" type = "text" name = "tag" placeholder="Тэг" />
            </div>
            <div class="input-group">
                <input class="form-control mb-3" type = "file" name = "file">
            </div>
            <div class="input-group">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary mb-3" type = 'submit'>Добавить</button>
            </div>
        </form>
    </div>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img src="${message.filename}" class="card-img-top" />
                </#if>
                <div class="m-2">
                    <span>${message.text}</span>
                    <i>${message.tag}</i>
                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
        <#else>
            No messages
        </#list>
    </div>
</@c.page>