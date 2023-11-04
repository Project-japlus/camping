<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
	
	<c:forEach var="dto" items="${list }">
	<div>
	
		<form action="${cpath }/reservation/${dto.camping_idx}">
				<!--체크인 - 체크아웃 -->
		<div class="row d-flex border border-1 rounded-2 w-50 m-auto mt-3 p-3">

			<div class="dates-wrapper group">

				<!-- 캠핑 시작 날짜 -->
				<div class="field clearfix date-range-start date-wrapper">
					<div class="label">
						<label for="datepicker-start">체크인:</label>
					</div>
					<div class="input">
						<input type="date" name="reserve_str_date" id="datepicker-start"
							class="input-text" placeholder="dd/mm/yyyy" required>
					</div>
					<a href="#" class="calendar-btn calendar-start hide-text">View
						calendar</a>
				</div>

				<!-- 캠핑 끝 날짜 -->
				<div class="field clearfix date-range-start date-wrapper">
					<div class="label">
						<label for="datepicker-end">체크아웃:</label>
					</div>
					<div class="input">
						<input type="date" name="reserve_end_date" id="datepicker-end"
							class="input-text" placeholder="dd/mm/yyyy" required>
					</div>
					<a href="#" class="calendar-btn hide-text">View calendar</a>
				</div>
				
				<!-- 달력 -->
				<script>
                    if ( $('html').hasClass('no-touch') ) {
                        var $input, $btn;
                        $( ".date-wrapper" ).each(function( index ) {
                            $input = $(this).find('input');
                            $btn = $(this).find('.calendar-btn');
                            $input.attr('type', 'text');
                            var pickerStart = new Pikaday({
                            field: $input[0],
                            trigger: $btn[0],
                            container: $(this)[0],
                            format: 'dd/mm/yyyy',
                            firstDay: 1
                            });
                            $btn.show();
                        });
                        } else {
                        $('.date-wrapper input').attr('type', 'date');
                        $('.calendar-btn').hide();
                        }
                    
                </script>
                
			</div>
		</div>
		<input type="submit" value="날짜">
		</form>
		
		
<%-- 		<a href="${cpath }/reservation/${dto.camping_idx}?reserve_str_date=${dto.reserve_str_date}&reserve_end_date=${dto.reserve_end_date}&reserve_site=${dto.reserve_site}" >${dto.camping_idx }</a> --%>
	</div>	
<%-- 	<div>${dto.reserve_str_date }</div> --%>
	</c:forEach>

</body>
</html>