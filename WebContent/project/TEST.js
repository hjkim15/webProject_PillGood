(function () { 'use strict';

var body = $( '.container' );

var form = body.find( '#prdForm' );

var app = {

    init: function () {

        this.event();

        var searchCategory = form.find( '#searchCategory' ).val();

        // �ʼ� �˻�
        if ( searchCategory === 'PROD_NAME' || searchCategory === 'CHOSUNG' ) {
            var initialSoundsElement = form.find( '#choSung' );
            var initialSounds = ( initialSoundsElement.val() || '' ).trim();
            if ( initialSounds !== '' ) {
                form.find( '.search-ini-box' ).filter( function () {
                    return $( this ).text() === initialSounds;
                }).css( 'backgroundColor', '#c3c3c3' );
            }
        }

        var sortedDdl = $.makeArray($('select[id$=effctFl] option')).sort(

			function(o, n) {
				return $(o).text() < $(n).text() ? -1 : 1;
			});

			$("select[id$=effctFl]").html(sortedDdl).val("");

			$(this).attr("disabled", "disabled");

			if($("#kor").val()=="kor"){
				$("#effctFl").prepend("<option value=''>��ü</option>");
				$("#effctFl").append("<option value='420'>Medical Beauty</option>");
				$("#effctFl").append("<option value='394'>��Ÿ</option>");
				console.log("Ȯ��",$("#effctFl option:eq(26)").val());
				$("#effctFl option:eq(27)").remove();
				$("#effctFl option:eq(1)").remove();
				$("#effctFl option:eq(6)").remove();
			}else{
				$("#effctFl").prepend("<option value=''>Select a efficacy</option>");
                $("#effctFl").append("<option value='394'>Etc</option>");

                console.log("Ȯ��29",$("#effctFl option:eq(29)").val());
                $("#effctFl option:eq(29)").remove();

                console.log("Ȯ��15",$("#effctFl option:eq(15)").val());
                console.log("Ȯ��16",$("#effctFl option:eq(16)").val());
                $("#effctFl option:eq(15)").remove();
			}


			var sortedDdl2 = $.makeArray($('select[id$=prodFl] option')).sort(

		      function(o, n) {
					return $(o).text() < $(n).text() ? -1 : 1;
				});

				$("select[id$=prodFl]").html(sortedDdl2).val("");

				$(this).attr("disabled", "disabled");

				if($("#kor").val()=="kor"){
					$("#prodFl").prepend("<option value=''>��ü</option>");
					$("#prodFl").append("<option value='372'>��Ÿ</option>");
					$("#prodFl option:eq(6)").remove();
					$("#prodFl option:eq(2)").remove();
				}

				else{
					$("#prodFl").prepend("<option value=''>Select a efficacy</option>");
					$("#prodFl option:eq(6)").remove();

				}
    },

    event: function () {

        body
        // �˻�
        .on( 'click', '.btnSearch', function ( e ) {

            Storm.EventUtil.stopAnchorAction( e );

            var data = $( this ).data() || {};

            var searchCategory = data.searchCategory;

            var choYn = data.choYn;

            form.find( '#searchCategory' ).val( searchCategory );

            form.find( '#choYn' ).val( choYn || 'N' );

            if ( form.valid() ) {

                form.submit();

            }
        })
        // �ʼ� ����
        .on( 'click', '.search-ini-box', function ( e ) {

            Storm.EventUtil.stopAnchorAction( e );

            var initialSoundsElement = $( this );

            initialSoundsElement
                .css( 'backgroundColor', '#c3c3c3' )
                .siblings( '.search-ini-box' )
                .css( 'backgroundColor', '' );

            var initialSounds = ( initialSoundsElement.text() || '' ).trim();

            if ( initialSounds === '' ) {
                return;
            }

            form.find( '#choSung' ).val( initialSounds );
        })
        // �ܺ� ��ũ
        .on( 'click', '#externLink', function ( e ) {

            Storm.EventUtil.stopAnchorAction( e );

            // ��ǰ������ �˻�(�ּ�: http://www.health.kr/searchIdentity/search.asp)�� ��â����
            var url = 'http://www.health.kr/searchIdentity/search.asp';

            var drugName = ( form.find( '#prodName' ).val() || '' ).trim();
            if ( drugName !== '' ) {
                url += '?drug_name=' + encodeURIComponent( drugName );
            }

            window.open( url, 'CKD_PRODUCT_LIST_EXTERN_LINK' );
        })
        // ��� ����
        .on( 'click', '#btnList', function ( e ) {

            Storm.EventUtil.stopAnchorAction( e );

            form.find( '#searchCategory' ).val( '' ).end().submit();

        })
        // �� ��ȸ
        .on( 'click', '.prod-list a.link', function ( e ) {

            Storm.EventUtil.stopAnchorAction( e );

            var root = $( this ).closest( 'div[data-prod-code]' );

            if ( root.length > 0 ) {
                
                var prodCode = root.data( 'prodCode' ) || 0;

                if ( prodCode !== 0 ) {

                    document.location.href = ContextPathWithLocale + '/product/productView.do?prodCode=' + prodCode;

                }
            }
        })
        .find( '#grid' ).grid( form );
    }
};

app.init();

})();