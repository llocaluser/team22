<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>잊지마! 있지마켓</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="/resources/assets/css/main.css" />
		<link rel="stylesheet" href="/resources/assets/css/product.css" />
		<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
		<style>
			#sidebar.force-inactive{
				margin-left: -26em;
			}
		</style>
	</head>
	<body>

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<c:import url="../include/header.jsp"/>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1>있지마켓 상품등록</h1>
										</header>
									</div>
			
			
			
								</section>

<section style="display:flex; justify-content:center;">
	<form id="regProd" action="/product/regProduct" method="post" enctype="multipart/form-data">
		<input type="hidden" name="product_seller" value="${product_seller }">
		<div class="regProd">
		<div id="regTitle">
			제목 <input type="text" name="product_title" 
			 onchange="validateForm()" onkeyup="return checkByte(this, 50, document.getElementById('inputAlert1'));">
			<span id="inputAlert1" style="color: red;"></span>
		</div>
		<div id="regCategory" class="select-container">
			<select name="product_cate" onchange="validateForm()">
				<option value="" hidden>분류</option>
				<option value="의류">의류</option>
				<option value="가전제품">가전제품</option>
				<option value="식기,가구">식기,가구</option>
				<option value="디지털,전자기기">디지털,전자기기</option>
				<option value="식품,생필품">식품,생필품</option>
				<option value="스포츠,건강">스포츠,건강</option>
				<option value="기기,공구">기기,공구</option>
				<option value="도서,쿠폰">도서,쿠폰</option>
				<option value="유아">유아</option>
				<option value="애완동물">애완동물</option>
				<option value="기타">기타</option>
			</select>
		</div>
		</div>
		
		내용
		<textarea rows="5" cols="" name="product_content" 
		 onchange="validateForm()" onkeyup="return checkByte(this, 1000, document.getElementById('inputAlert2'));"></textarea>
		<span id="inputAlert2" style="color: red;"></span>
		<div class="regProd">
		<div id="regPrice">
			가격 <input type="number" name="product_price" min='0' max='100000000' step='10' onchange="validateForm()">
			<span id="priceAlert" style="color: red;"></span>
		</div>
		<div id="regGrade" class="select-container">
			<select name="product_grade" onchange="validateForm()">
				<option value="" hidden>상품상태</option>
				<option value="상">상</option>
				<option value="중">중</option>
				<option value="하">하</option>
			</select>
		</div>
		</div>
		
		<div id="file-inputs-container">
		제품사진
			<div class="file-input-wrapper">
				<div id="div-file">
				<div class="div-file-insert">
					<input type="file" name="product_pics" onchange="validateForm()">
				</div>
				<div class="div-button">
					<button type="button" class="add-button">+</button>
				</div>
				</div>
			</div>
		</div>
		
		<input id="submitButton" type="submit" value="등록하기">
	</form>
	</section>

						</div>
					</div>

				
				<!-- Sidebar -->
					<c:import url="../include/sidebar.jsp"/>
			
			</div>

		<!-- Scripts -->
			<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript">
	
	function validateForm() {
	    const productTitle = document.getElementsByName("product_title")[0];
	    const productCate = document.getElementsByName("product_cate")[0];
	    const productContent = document.getElementsByName("product_content")[0];
	    const productPrice = document.getElementsByName("product_price")[0];
	    const productGrade = document.getElementsByName("product_grade")[0];
	    const productPics = document.getElementsByName("product_pics")[0];
	    const submitButton = document.getElementById("submitButton");

	    if (productTitle.value.trim() !== "" &&
	        productCate.value !== "" &&
	        productContent.value.trim() !== "" &&
	        productPrice.value.trim() !== "" &&
	        productGrade.value !== "" &&
	        productPics.files.length > 0) {
	        submitButton.disabled = false;
	    } else {
	        submitButton.disabled = true;
	    }
	}

	validateForm();

	
	document.addEventListener('DOMContentLoaded', function () {
	    let fileInputCounter = 1;

	    document.querySelector('#file-inputs-container').addEventListener('click', function (event) {
	        if (event.target.classList.contains('add-button') && fileInputCounter < 3) {
	            const newFileInputWrapper = document.createElement('div');
	            newFileInputWrapper.classList.add('file-input-wrapper');

	            const newDivFile = document.createElement('div');
	            newDivFile.id = 'div-file';

	            const newDivFileInsert = document.createElement('div');
	            newDivFileInsert.classList.add('div-file-insert');

	            const newFileInput = document.createElement('input');
	            newFileInput.type = 'file';
	            newFileInput.name = 'product_pics';
	            newFileInput.onchange = function() {
	                validateForm();
	                validateImageFile(newFileInput);
	            };

	            newDivFileInsert.appendChild(newFileInput);

	            const newDivButton = document.createElement('div');
	            newDivButton.classList.add('div-button');

	            const newButton = document.createElement('button');
	            newButton.type = 'button';
	            newButton.classList.add('add-button');
	            newButton.textContent = '+';

	            newDivButton.appendChild(newButton);

	            newDivFile.appendChild(newDivFileInsert);
	            newDivFile.appendChild(newDivButton);

	            newFileInputWrapper.appendChild(newDivFile);

	            document.querySelector('#file-inputs-container').appendChild(newFileInputWrapper);

	            fileInputCounter++;
	        }
	    });
	    
	    const initialFileInput = document.querySelector('input[name="product_pics"]');
	    initialFileInput.onchange = function() {
	        validateForm();
	        validateImageFile(initialFileInput);
	    };
	});

	function validateImageFile(fileInput) {
	    if (fileInput.files.length > 0) {
	        const file = fileInput.files[0];
	        const fileName = file.name;
	        const fileExtension = fileName.substring(fileName.lastIndexOf('.') + 1).toLowerCase();

	        if (['jpg', 'jpeg', 'png'].indexOf(fileExtension) < 0) {
	            alert('올바른 이미지 형식을 업로드해주세요. (jpg, jpeg, png)');
	            fileInput.value = '';
	        }
	    }
	}



	
	function checkByte(inputElement, maxBytes, alertS) {
		  const text = inputElement.value;
		  let currentBytes = 0;

		  for (let i = 0; i < text.length; i++) {
		    const charCode = text.charCodeAt(i);
		    if (charCode <= 0x7F) {
		      currentBytes += 1;
		    } else if (charCode <= 0x7FF) {
		      currentBytes += 2;
		    } else {
		      currentBytes += 3;
		    }

		    if (currentBytes > maxBytes) {
		      inputElement.value = text.substring(0, i);
		      alertS.innerHTML = '글자 최대 바이트 수는 ' + maxBytes + '입니다';
		      return false;
		    }else{
		    	alertS.innerHTML = '';
		    }
		  }
		  return true;
		}


	
	document.getElementById('regProd').addEventListener('submit', function (event) {
		  const priceInput = document.getElementById('product_price');
		  const contentInput = document.getElementById('product_content');

		  if (!checkByte(contentInput, 1000)) {
		    event.preventDefault();
		  }
	});

	
	</script>
			<script src="/resources/assets/js/jquery.min.js"></script>
			<script src="/resources/assets/js/skel.min.js"></script>
			<script src="/resources/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="/resources/assets/js/main.js"></script>

	</body>
</html>