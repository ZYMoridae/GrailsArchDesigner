<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="main" />
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
    <title><g:message code="default.list.label" args="[entityName]" /></title>

    %{--ArchDesigner CSS--}%
    <asset:stylesheet src="archdesigner.css"/>
</head>
<body>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    %{--Begin modal-dialog--}%
    <div class="modal-dialog" role="document">
        %{--Begin modal-content--}%
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2 class="modal-title" id="myModalLabel">Add ${entityName}</h2>
            </div>
        %{--Begin modal-body--}%
        <div class="modal-body">
            <g:form action="save">

            %{--Start substitution--}%
                <fieldset class="form">
                    <div class='fieldcontain required'>
                        <label for='email'>Email
                            <span class='required-indicator'>*</span>
                        </label>
                        <input type="text" name="email" value="" required="" id="email" />
                    </div>
                    <div class='fieldcontain required'>
                        <label for='name'>Name
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="name" value="" required="" id="name" />
                    </div>
                    <div class='fieldcontain required'>
                        <label for='password'>Password
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="password" value="" required=""
                                       id="password" />
                    </div>
                    <div class='fieldcontain required'>
                        <label for='token'>Token
                            <span class='required-indicator'>*</span>
                        </label><input type="text" name="token" value="" required="" id="token" />
                    </div>
                </fieldset>
            %{--End substitution--}%


                </div>
                %{--End modal-body--}%
                <div class="modal-footer">

                         <fieldset class="buttons">
                         <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </fieldset>
            </g:form>
        </div>
        </div>
        %{--End modal-content--}%
    </div>
    %{--End modal-dialog--}%
</div>




<h1 class="ad-model-h1"><g:message code="default.list.label" args="[entityName]" /></h1>
%{--Start row--}%
<div class="row">
    %{--Start col-md-12--}%
    <div class="col-md-12">
        %{--Start panel--}%
        <div class="panel panel-default">
            <div class="panel-heading">
                <a data-toggle="modal" data-target="#myModal">
                    <i class="ad-add fa fa-plus-circle fa-2x"></i>
                </a>
            </div>
            %{--Start panel-body--}%
            <div class="panel-body" style="text-align: center;">
                <table id="userContent" class="table table-striped table-bordered">
                    <thead>
                    <tr>
                        <td>Email</td>
                        <td>Name</td>
                        <td>Password</td>
                        <td>Token</td>
                        <td>Edit</td>
                        <td>Delete</td>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${userList}" var="user" status="i">
                        <tr>
                            <td>${user.email}</td>
                            <td>${user.name}</td>
                            <td>${user.password}</td>
                            <td>${user.token}</td>
                            <td>
                                %{--Start modal--}%
                                <div class="ad-model-edit modal fade" id="myuserModal-${user.id}" tabindex="-1"
                                     role="dialog"
                                     aria-labelledby="myModalLabel">
                                    %{--Start modal-dialog--}%
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                                <h2 class="modal-title" id="myModalLabel2"
                                                >Edit
                                                    ${entityName}</h2>
                                            </div>
                                            %{--Start modal-body--}%
                                        <div class="modal-body">
                                            <g:form resource="${user}" method="PUT">
                                                <g:hiddenField name="version" value="${this.user?.version}" />

                                            %{--Start substitution--}%
                                                <fieldset class="form">
                                                    <div class='fieldcontain required'>
                                                        <label for='email'>Email
                                                            <span class='required-indicator'>*</span>
                                                        </label><input type="text" name="email" value="${user.email}"
                                                                       required="" id="email2" />
                                                    </div><div class='fieldcontain required'>
                                                    <label for='name'>Name
                                                        <span class='required-indicator'>*</span>
                                                    </label><input type="text" name="name" value="${user.name}"
                                                                   required="" id="name2" />
                                                </div><div class='fieldcontain required'>
                                                    <label for='password'>Password
                                                        <span class='required-indicator'>*</span>
                                                    </label><input type="text" name="password" value="${user.password}"
                                                                   required="" id="password2" />
                                                </div><div class='fieldcontain required'>
                                                    <label for='token'>Token
                                                        <span class='required-indicator'>*</span>
                                                    </label><input type="text" name="token" value="${user.token}"
                                                                   required="" id="token2" />
                                                </div>
                                                </fieldset>
                                            %{--End substitution--}%

                                                </div>
                                                %{--End modal-body--}%
                                                <div class="modal-footer">

                                                    <fieldset class="buttons">
                                                     <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                     <input class="save btn btn-primary" type="submit" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                                                        </fieldset>
                                            </g:form>
                                        </div>
                                        </div>
                                    </div>
                                    %{--End modal-dialog--}%
                                </div>
                                %{--End modal--}%



                                <a data-toggle="modal"
                                   data-target="#myuserModal-${user.id}"
                                >
                                    <i class="ad-edit fa fa-pencil fa-2x"></i>
                                </a>

                            </td>
                            <td>
                                <g:form resource="${user}" method="DELETE">
                                    <a onclick="$(this).closest('form').submit();"
                                    >
                                        <i class="ad-delete fa fa-trash-o fa-2x"></i>
                                    </a>
                                </g:form>
                            </td>
                        </tr>
                    </g:each>
                    </tbody>


                </table>

                <div class="pagination">
                    <g:paginate next="Next" prev="Prev" total="${userCount ?: 0}" />
                </div>

            </div>
            %{--End panel-body--}%
            <div class="panel-footer" >
                <h3 class="panel-title">
                    MSEP Group1
                </h3>
            </div>
        </div>
        %{--End panel--}%
    </div>
    %{--End col-md-12--}%
</div>


<script>
    $(document).ready(function(){
        $("form input").addClass("form-control");
    });
</script>

</body>
</html>