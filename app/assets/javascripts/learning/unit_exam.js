$(document).ready(function() {
    // 容器
    var $container = $('#unit_exam');

    // 提交表单
    function submitAnswers() {
        $container.find('[data-event="exam.submitted"]').val(1);
        $container.find('form').submit();
    }

    // 格式化 seconds
    function formatCountdown(seconds) {
        var abs = Math.abs(seconds),
            h = abs / 60 / 60,
            m = (h % 1) * 60,
            s = (m % 1) * 60;
        return  (seconds < 0 ? '-' : '') +
                (Math.floor(h)) + ":" + 
                (Math.floor(m)) + ":" + 
                (Math.floor(s));
    }

    // 计算剩余时间部分
    var $seconds = $container.find('[data-seconds]');
    var seconds = $seconds.data('seconds');

    $seconds.html(formatCountdown(seconds));

    if ($seconds.size() > 0) {
        setInterval(function() {
            if (seconds > 0) {
                $seconds.html(formatCountdown(seconds -= 1));
            } else {
                submitAnswers();
            }
        }, 1000);
    }

    // 哪些题目未做
    $container.find('[data-event="exam.unmark"]').on('click', function(e) {
        e.preventDefault();
        // 添加未完成记号
        $container.find('.choice').each(function(index, value) {
            if ($(value).find('input:checked').size() === 0) {
                $(value).addClass('unfinished');
            }
        });
        // 快速定位
        $('body, html').animate({
          scrollTop: $('.unfinished:nth(0)').position().top
        }, 'fast');
    });

    // 选择题选项改变
    $container.find('.choice input').change(function(e) {
        $(this).closest('.unfinished').removeClass('unfinished');
        $.post($container.find('form').attr('action'), $container.find('form').serialize());
    });

    // 交卷
    $container.find('[data-event="exam.submit"]').on('click', function(e) {
        if (confirm('是否交卷？')) {
            submitAnswers();
        }
    });

    $container.find('[data-event="affix"]').affix({
        offset: {
            top: 100,
            bottom: function () {
                return (this.bottom = $('footer').outerHeight(true))
            }
        }
    })
});