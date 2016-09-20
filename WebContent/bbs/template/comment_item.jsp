<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>

<!-- 덧글 항목에 대한 템플릿 참조 -->
<script id="tmpl_comment_item" type="text/x-jquery-tmpl">
    <li class="media" style='border-top: 1px dotted #ccc; padding-top: 15px'>
        <div class="media-body" style='display: block;'>
            <h4 class="media-heading clearfix">
                <!-- 작성자,작성일시 -->
                <div class='pull-left'>
                    {{html writer_name}}
                    <small>
                        <a href='mailto:{{html email}}'>
                            <i class='glyphicon glyphicon-envelope'></i></a> / {{html reg_date}}
                    </small>
                </div>
                <!-- 수정,삭제 버튼 -->
                <div class='pull-right'>
                    <a href='#' class='btn btn-default btn-sm'>
                        <i class='glyphicon glyphicon-edit'></i>
                    </a>
                    <a href='#' class='btn btn-default btn-sm'>
                        <i class='glyphicon glyphicon-remove'></i>
                    </a>
                </div>
            </h4>
            <!-- 내용 -->
            <p>{{html content}}</p>
        </div>
    </li>
</script>