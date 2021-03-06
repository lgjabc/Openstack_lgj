# mysql存储过程
存储过程是一组为了完成特定功能的SQL 语句集,存储在数据库中,经过第一次编译后再次调用不需要再次编译,用户通过指定存储过程的名字并给出参数（如果该存储过程带有参数）来执行它。它的作用与Java中的方法类似。
MySQL 存储过程是从 MySQL 5.0 开始增加的新功能。存储过程的优点最主要的还是执行效率和SQL 代码封装。特别是 SQL 代码封装功能,如果没有存储过程,在外部程序访问数据库时,要组织很多 SQL 语句。特别是业务逻辑复杂的时候,一大堆的 SQL 和条件夹杂在程序代码中,有了 存储过程,业务逻辑可以封装存储过程中,这样不仅容易维护,而且执行效率也高。

在sql中也可以声明(declare )变量,使用条件分支(if then),循环结构(loop)等。

创建 MySQL 存储过程的简单语法为：
create procedure 存储过程名字( )
(
[in|out|inout] 参数 datatype
)
begin
MySQL 语句;
end;

MySQL 存储过程参数如果不显式指定"in"、"out"、"inout",则默认为"in"。习惯上,对于是"in" 的参数,我们都不会显式指定。in参数表示输入参数,out参数表示输出参数,相当于返回值。

1. MySQL 存储过程名字后面的"()"是必须的,即使没有一个参数,也需要"()"
2. MySQL 存储过程参数,不能在参数名称前加"@",如："@a int"。下面的创建存储过程语法在 MySQL 中是错误的。 MySQL 存储过程中的变量,不需要在变量名字前加"@",虽然 MySQL 客户端用户变量要加个"@"。
create procedure pr_add
(
@a int,- 错误
b int - 正确
)

3. MySQL 存储过程的参数不能指定默认值。
4. 如果 MySQL 存储过程中包含多条 MySQL 语句,则需要 begin end 关键字。
create procedure pr_add
(
a int,
b int
)
begin
mysql statement 1 ...;
mysql statement 2 ...;
end;

5. MySQL 存储过程中的每条语句的末尾,都要加上分号 ";"
...
declare c int;
if a is null then
set a = 0;
end if;
...
end;
6. MySQL 存储过程中的注释。

/*
这是个
多行 MySQL 注释。
*/
declare c int; - 这是单行 MySQL 注释 （注意- 后至少要有一个空格）
if a is null then 这也是个单行 MySQL 注释
set a = 0;
end if;
...
end;

7. 不能在 MySQL 存储过程中使用 "return" 关键字。
set c = a + b;
select c as sum;
/*
return c;- 不能在 MySQL 存储过程中使用。return 只能出现在函数中。
*/
end;

8. 调用 MySQL 存储过程时候,需要在过程名字后面加"()",即使没有一个参数,也需要"()"
call pr_no_param();
9. 因为 MySQL 存储过程参数没有默认值,所以在调用 MySQL 存储过程时候,不能省略参数。可以用 null 来替代。
call pr_add(10, null);
