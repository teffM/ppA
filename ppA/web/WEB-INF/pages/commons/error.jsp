<%@taglib uri="/struts-tags" prefix="s"%>


<div id="toast-container" class="toast-full-width">
    <div class="toast toast-error">
        <div class="toast-message">
            <s:property escape="false" value="errorMsg" />
        </div>
    </div>
</div>