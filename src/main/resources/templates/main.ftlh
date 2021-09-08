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
    <div class = "collapse <#if message??>show</#if>" id="collapseExample">
        <form method="post" enctype="multipart/form-data">
            <div class="form-group mb-3">
                <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                       value="<#if message??>${message.text}</#if>" name="text" placeholder="Введите сообщение" />
                <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
                </#if>
            </div>
            <div class="form-group mb-3">
                <input type="text" class="form-control"
                       value="<#if message??>${message.tag}</#if>" name="tag" placeholder="Тэг">
                <#if tagError??>
                    <div class="invalid-feedback">
                        ${tagError}
                    </div>
                </#if>
            </div>
            <div class="input-group mb-3">
                <input class="form-control" type = "file" name = "file">
            </div>
            <div class="input-group mb-3">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <button class="btn btn-primary" type = 'submit'>Добавить</button>
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
            <div class="m-2">
                <span>No messages</span>
            </div>
        </#list>
    </div>
</@c.page>