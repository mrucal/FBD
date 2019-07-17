/* Ejercicio 3.45 */
select codpro from ventas group by codpro having count(*)>=10;

