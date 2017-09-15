<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--Featured Section-->
<section id="features" class="features">
	<div class="container">
		<div class="row">
			<div class="main_features fix roomy-70">
				<c:forEach items="${layout.allFeatures}" var="feature" >
					<div class="col-md-4">
						<div class="features_item sm-m-top-30">
							<div class="f_item_icon">
								<i class="${feature.featureIcon}"></i>
							</div>
							<div class="f_item_text">
								<h3>${feature.featuredTitle}</h3>
								<p>${feature.featuredContent}</p>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</section>